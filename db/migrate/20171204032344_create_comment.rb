class CreateComment < ActiveRecord::Migration[5.1]
  def change
  	create_table :comment do |t|
  		t.string :content
  		t.datetime :datetime
  	end
  end
end
