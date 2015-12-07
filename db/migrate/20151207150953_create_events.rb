class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :location
      t.string :note
      t.integer :user_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
