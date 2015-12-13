class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
