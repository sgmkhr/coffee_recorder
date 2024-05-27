class CreateFlavorTags < ActiveRecord::Migration[6.1]
  def change
    create_table :flavor_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
