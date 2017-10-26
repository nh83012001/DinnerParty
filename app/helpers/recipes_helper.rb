module RecipesHelper

  def test_recipe_ownership
    return true unless get_user_id == nil && get_user_id == recipe.owner_id
  end
end
