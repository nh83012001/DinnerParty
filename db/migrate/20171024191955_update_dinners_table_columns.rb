class UpdateDinnersTableColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :dinners, :time
    change_column :dinners, :date, :datetime
  end
end
