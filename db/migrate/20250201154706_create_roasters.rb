class CreateRoasters < ActiveRecord::Migration[8.0]
  def change
    create_table :roasters do |t|
      t.string :name
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
