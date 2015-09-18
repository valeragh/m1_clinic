class RenameDescriprionInService < ActiveRecord::Migration
  def change
    rename_column :services, :descriprion, :description
  end
end
