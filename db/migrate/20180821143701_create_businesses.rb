class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.integer :average_english_rating
      t.integer :average_rating
      t.string :photo

      t.timestamps
    end
  end
end
