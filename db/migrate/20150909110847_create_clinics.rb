class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :address
      t.text :contacts
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :title
      t.string :slug

      t.timestamps
    end
    add_index :clinics, :slug, unique: true
  end
end
