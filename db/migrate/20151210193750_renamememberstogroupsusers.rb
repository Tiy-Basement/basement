class Renamememberstogroupsusers < ActiveRecord::Migration
  def change
    rename_table :members, :groups_users
  end
end
