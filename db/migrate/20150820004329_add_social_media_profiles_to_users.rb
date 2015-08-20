class AddSocialMediaProfilesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_username, :string
    add_column :users, :github_username, :string
  end
end
