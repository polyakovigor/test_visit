class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :date
      t.integer :number
      t.text :description

      t.timestamps
    end
  end
end
