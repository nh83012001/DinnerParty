class CreateDinners < ActiveRecord::Migration[5.0]
  def change
    create_table :dinners do |t|
      t.string :location
      t.datetime :time
      t.integer :host_id
      t.string :name
      t.string :attire

      t.timestamps
    end
  end
end
