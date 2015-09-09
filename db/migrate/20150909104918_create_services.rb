class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :image_url
      t.string :image_small_url
      t.text :descriprion
      t.integer :service_category_id
      t.string :slug

      t.timestamps
    end
    add_index :services, :slug, unique: true
  end
end
