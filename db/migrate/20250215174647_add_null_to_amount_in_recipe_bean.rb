class AddNullToAmountInRecipeBean < ActiveRecord::Migration[8.0]
  def change
    change_column_null :recipe_beans, :amount, true
  end
end
