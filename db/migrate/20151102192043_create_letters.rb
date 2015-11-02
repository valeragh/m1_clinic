class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description
      t.datetime :checked_out_at

      t.timestamps
    end
  end
end
