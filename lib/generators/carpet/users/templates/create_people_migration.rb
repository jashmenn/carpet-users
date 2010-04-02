class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :email
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country

      t.timestamps
    end
    add_index :people, :email
  end

  def self.down
    drop_table :people
  end
end
