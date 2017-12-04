class AddSlugToPublishers < ActiveRecord::Migration[5.1]
  def change
    add_column :publishers, :slug, :string
    add_index :publishers, :slug, unique: true
  end
end

