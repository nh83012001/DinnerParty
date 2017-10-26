module DinnersHelper
  def test_ownership(coursedrink, user, dinner)
    coursedrink.user.id == get_user_id && user.has_drink_course_privalege(dinner)
  end
end
