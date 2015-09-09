class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.string :title
      t.string :slug, :null => false
      t.string :image_url
      t.index :slug, unique: true

      t.timestamps
    end
  end
end
