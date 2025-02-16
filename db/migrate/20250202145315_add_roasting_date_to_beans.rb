class AddRoastingDateToBeans < ActiveRecord::Migration[8.0]
  def change
    add_column :beans, :roasted_at, :date
  end
end