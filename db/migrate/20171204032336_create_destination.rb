class CreateDestination < ActiveRecord::Migration[5.1]
  def change
  	create_table :destinations do |t|
  		t.string :country
  	end
  end
end
