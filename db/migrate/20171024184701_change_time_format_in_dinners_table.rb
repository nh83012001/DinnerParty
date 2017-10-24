class ChangeTimeFormatInDinnersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :dinners, :time, :time
  end
end
