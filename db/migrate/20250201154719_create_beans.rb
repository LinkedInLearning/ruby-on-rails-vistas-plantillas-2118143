class CreateBeans < ActiveRecord::Migration[8.0]
  def change
    create_table :beans do |t|
      t.string :name
      t.string :origin
      t.text :tasting_notes
      t.references :roaster, null: false, foreign_key: true

      t.timestamps
    end
  end
end
