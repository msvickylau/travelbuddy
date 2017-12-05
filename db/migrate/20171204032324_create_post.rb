class CreatePost < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
      t.integer :user_id
  		t.string :title
  		t.string :content
  		t.datetime :datetime
  	end
  end
end
