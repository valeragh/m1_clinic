class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
