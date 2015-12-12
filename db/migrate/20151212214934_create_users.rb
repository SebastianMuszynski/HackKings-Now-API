class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :phone_number
      t.boolean :verified, default: false

      t.timestamps null: false
    end
  end
end
