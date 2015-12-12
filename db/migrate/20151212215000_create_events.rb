class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name,        null: false
      t.string :description
      t.decimal :latitude,   precision: 15, scale: 13
      t.decimal :longitude,  precision: 15, scale: 13
      t.integer :radius,     default:   1
      t.references :users,   index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
