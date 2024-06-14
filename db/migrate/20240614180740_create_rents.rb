class CreateRents < ActiveRecord::Migration[7.1]
  def change
    create_table :rents do |t|
      t.datetime :start_date
      t.integer :duration
      t.references :bike, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
