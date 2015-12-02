class CreateCookiejars < ActiveRecord::Migration
  def change
    create_table :cookiejars do |t|
      t.string :cookie
      t.integer :used

      t.timestamps null: false
    end
  end
end
