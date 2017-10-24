class AddTypeToCourses < ActiveRecord::Migration[5.0]
  def change
        add_column :courses, :type, :string
  end
end
