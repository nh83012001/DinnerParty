class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :dinner_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
