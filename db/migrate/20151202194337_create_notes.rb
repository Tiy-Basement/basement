class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.string :color
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
