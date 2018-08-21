class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.float  :latitude
      t.float  :longitude
      t.string :photo

      t.timestamps
    end
  end
end

