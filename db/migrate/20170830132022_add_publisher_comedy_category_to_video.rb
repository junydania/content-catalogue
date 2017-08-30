class AddPublisherComedyCategoryToVideo < ActiveRecord::Migration[5.1]
  def change
    add_reference :videos, :publisher, index: true, foreign_key: true
    add_reference :videos, :comedian, index: true, foreign_key: true
    add_reference :videos, :category, index: true, foreign_key: true

  end
end
