class AllowFirstNameToBeNullable < ActiveRecord::Migration
  def change
    change_column :users, :first_name, :string, null: true
  end
end
