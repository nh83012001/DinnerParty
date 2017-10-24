class ChangeRecipeIdToUserrecipeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :courses, :recipe_id, :userrecipe_id
  end
end
