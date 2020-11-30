class CreateEntryHasSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_has_symptoms do |t|
      t.references :entry, null: false, foreign_key: true
      t.references :symptom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
