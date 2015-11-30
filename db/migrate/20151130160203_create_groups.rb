class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :owner_id
      t.string :category
      t.string :join_password
      t.boolean :public

      t.timestamps null: false
    end
  end
end
