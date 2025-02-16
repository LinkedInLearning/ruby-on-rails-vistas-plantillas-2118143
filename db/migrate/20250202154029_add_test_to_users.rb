class AddTestToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :test, :string
  end
end