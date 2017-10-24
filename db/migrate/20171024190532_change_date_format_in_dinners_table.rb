class ChangeDateFormatInDinnersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :dinners, :date, :datetime
  end
end
