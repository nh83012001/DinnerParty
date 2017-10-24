class AddDateToDinnerTable < ActiveRecord::Migration[5.0]
  def change
    add_column :dinners, :date, :date
  end
end
