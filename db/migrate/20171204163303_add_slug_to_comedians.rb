class AddSlugToComedians < ActiveRecord::Migration[5.1]
  def change
    add_column :comedians, :slug, :string
    add_index :comedians, :slug, unique: true
  end
end
