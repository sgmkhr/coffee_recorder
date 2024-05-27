class CreateRelatedPerfumeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :related_perfume_tags do |t|
      t.references :perfume_tag, null: false, foreign_key: true
      t.references :coffee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
