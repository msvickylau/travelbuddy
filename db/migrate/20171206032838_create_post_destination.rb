class CreatePostDestination < ActiveRecord::Migration[5.1]
  def change
    create_table :post_destinations do |t|
      t.integer :post_id
      t.integer :destination_id
    end
  end
end
