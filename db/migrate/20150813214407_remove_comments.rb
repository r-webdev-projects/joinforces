class RemoveComments < ActiveRecord::Migration
  def change
    if table_exists?(:comments)
      drop_table :comments
    end
  end
end
