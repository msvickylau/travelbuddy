class CreatePost < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
  		t.string :name
  		t.string :content
  		t.datetime :datetime
      t.integer :user_id
  	end
  end
end
