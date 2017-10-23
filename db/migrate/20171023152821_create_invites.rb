class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.integer :dinner_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
