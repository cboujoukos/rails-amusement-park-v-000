class CreateRides < ActiveRecord::Migration
  def up
    create_table :rides do |t|
      t.belongs_to :user
      t.belongs_to :attraction
    end
  end

  def down
    drop_table :rides
  end
end
