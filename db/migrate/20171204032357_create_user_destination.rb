class CreateUserDestination < ActiveRecord::Migration[5.1]
  def change
  	create_table :user_destination do |t|
  		t.integer :user_id
  		t.integer :destination_id
  	end
  end
end
