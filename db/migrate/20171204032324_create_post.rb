class CreatePost < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
      t.integer :user_id
  		t.string :title
  		t.string :content
      t.date :start_date
      t.date :end_date
      t.timestamps
  	end
  end
end
