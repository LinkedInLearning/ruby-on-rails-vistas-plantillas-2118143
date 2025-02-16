class CreateRecipeBeans < ActiveRecord::Migration[8.0]
  def change
    create_table :recipe_beans do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :bean, null: false, foreign_key: true
      t.float :amount, null: false
      t.timestamps
    end
  end
end