class AddPublishedToRecipe < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :published, :boolean, default: false
  end
end