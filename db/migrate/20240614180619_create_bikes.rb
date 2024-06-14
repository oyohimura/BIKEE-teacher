class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.string :model
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
