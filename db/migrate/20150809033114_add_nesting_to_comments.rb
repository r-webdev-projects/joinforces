class AddNestingToComments < ActiveRecord::Migration
  def change
    add_column :commontator_comments, :parent_id, :integer, null: true, index: true
    add_column :commontator_comments, :lft, :integer, index: true
    add_column :commontator_comments, :rgt, :integer, index: true
    add_column :commontator_comments, :depth, :integer, index: true
    add_column :commontator_comments, :children_count, :integer, index: true
  end
end
