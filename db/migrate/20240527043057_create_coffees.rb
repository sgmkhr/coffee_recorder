class CreateCoffees < ActiveRecord::Migration[6.1]
  def change
    create_table :coffees do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :shop
      t.integer :place
      t.text :introduction
      t.integer :total_rate
      t.integer :acidit_rate
      t.integer :richness_rate
      t.integer :bitterness_rate

      t.timestamps
    end
  end
end
