class FixDescriptionInRoaster < ActiveRecord::Migration[8.0]
  def change
    rename_column :roasters, :description, :bio
  end
end