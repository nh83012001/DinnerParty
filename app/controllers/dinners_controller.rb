class DinnersController < ApplicationController
  before_filter :authorize_invitee_host, only: :show
  include DinnersHelper

  def authorize_invitee_host

    if get_user_id == nil
      render :error
    else
      @dinner = Dinner.find(params[:id])
      @user = get_user_reference
      @invite = @dinner.invites.find_by(user: @user)
      unless @dinner.host == @user || @invite
        render :error
      end
    end
  end

  ##

  def show
    @dinner = Dinner.find(params[:id])
    @course = Course.new
    @drink = Drink.new
    @user = get_user_reference
    @invite = Invite.new

    @uninvited = User.uninvited(@dinner, @user)
    @invited = User.invited(@dinner)

    @comment = Comment.new
  end

  def new
    @owner = get_user_reference
    @other_users = User.other_users(get_user_id)
    @dinner = Dinner.new
    @dinner.invites.build
  end

  def create
    @dinner = Dinner.new(dinner_params)

    if @dinner.save
      params[:dinner][:user_ids].each do |id|
        @dinner.users << User.find(id) unless id==""
      end
      redirect_to dinner_path(@dinner)
    else
      @owner = get_user_reference
      @other_users = User.other_users(get_user_id)
      render :new
    end
  end

  def edit
    @dinner = Dinner.find(params[:id])
  end

  def update
    @dinner = Dinner.find(params[:id])
    @dinner.assign_attributes(dinner_params)
    if @dinner.save
      redirect_to dinner_path(@dinner)
    else
      render :edit
    end
  end

  def uninvite
    @dinner = Dinner.find(params[:dinner_id])
    @invite = Invite.find_by(invite_params, dinner_inv_params)
    @invite.destroy_related_courses
    @invite.destroy
    redirect_to dinner_path(@dinner)
  end

  def destroy
    @dinner = Dinner.find(params[:id])
    Invite.destroy_without_dinner(params[:id])
    Course.destroy_without_dinner(params[:id])
    @dinner.destroy
    redirect_to my_profile_path
  end



  private

  def dinner_params
    params.require(:dinner).permit(:location, :date, :host_id, :name, :attire)
  end

  def invite_params
    params.require(:invite).permit(:user_id)
  end

  def dinner_inv_params
    params.permit(:dinner_id)
  end

end
