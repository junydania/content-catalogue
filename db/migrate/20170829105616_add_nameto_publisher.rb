class AddNametoPublisher < ActiveRecord::Migration[5.1]
  def change
    add_column :publishers, :publisher_name, :string
  end
end

