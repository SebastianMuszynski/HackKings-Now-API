class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :description
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
