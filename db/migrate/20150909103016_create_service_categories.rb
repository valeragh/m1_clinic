class CreateServiceCategories < ActiveRecord::Migration
  def change
    create_table :service_categories do |t|
      t.string :name
      t.string :image_url
      t.string :image_small_url
      t.string :slug
      
      t.timestamps
    end
    add_index :service_categories, :slug, unique: true
  end
end
