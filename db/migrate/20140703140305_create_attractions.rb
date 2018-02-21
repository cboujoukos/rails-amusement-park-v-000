class CreateAttractions < ActiveRecord::Migration
  def up
   create_table :attractions do |t|
     t.string :name
     t.integer :tickets
     t.integer :nausea_rating
     t.integer :happiness_rating
     t.integer :min_height
   end
 end

 def down
   drop_table :attractions
 end
end
