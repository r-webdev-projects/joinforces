class AddUserReferencetoIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :user_id, :integer, references: :users
  end
end
