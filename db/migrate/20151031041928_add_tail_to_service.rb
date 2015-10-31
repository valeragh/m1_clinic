class AddTailToService < ActiveRecord::Migration
  def change
    add_column :services, :tail, :integer
  end
end
