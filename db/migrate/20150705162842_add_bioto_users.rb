class AddBiotoUsers < ActiveRecord::Migration
  def change
    add_column :users, :short_bio, :text
  end
end
