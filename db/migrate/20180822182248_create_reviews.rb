class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.string :place_id
      t.string :content
      t.integer :language_score

      t.timestamps
    end
  end
end
