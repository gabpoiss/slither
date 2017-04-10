class CreateSnakes < ActiveRecord::Migration[5.0]
  def change
    create_table :snakes do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :breed
      t.string :sex
      t.boolean :available
      t.float :price

      t.timestamps
    end
  end
end
