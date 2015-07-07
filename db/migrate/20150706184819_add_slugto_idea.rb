class AddSlugtoIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :slug, :string, unique: true
  end
end
