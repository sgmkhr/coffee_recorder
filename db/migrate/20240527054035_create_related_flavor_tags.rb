class CreateRelatedFlavorTags < ActiveRecord::Migration[6.1]
  def change
    create_table :related_flavor_tags do |t|
      t.references :flavor_tag, null: false, foreign_key: true
      t.references :coffee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
