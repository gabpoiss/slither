class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :snake, foreign_key: true
      t.references :booking, foreign_key: true
      t.text :content
      t.integer :stars

      t.timestamps
    end
  end
end
