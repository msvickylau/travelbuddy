class CreateComment < ActiveRecord::Migration[5.1]
  def change
  	create_table :comments do |t|
  		t.string :content
  		t.datetime :datetime
      t.integer :user_id
      t.integer :post_id
  	end
  end
end
