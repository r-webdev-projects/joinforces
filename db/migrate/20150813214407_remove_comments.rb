class RemoveComments < ActiveRecord::Migration
  def change
    drop_table :comments, if_exists: true
  end
end
