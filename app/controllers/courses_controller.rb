class CoursesController < ApplicationController
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to dinner_path(params[:course][:dinner_id])
    else
      flash.now[:error] = 'There was an error in adding your recipe!'
      redirect_to my_profile_path
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @dinner = Dinner.find(@course.dinner_id)
    @course.destroy
    redirect_to dinner_path(@dinner)
  end

  private

  def course_params
    params.require(:course).permit(:dinner_id, :userrecipe_id, :course_type)
  end
end
