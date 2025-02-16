class RemoveTestFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :test, :string
  end
end