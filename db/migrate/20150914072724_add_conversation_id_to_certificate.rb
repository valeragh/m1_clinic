class AddConversationIdToCertificate < ActiveRecord::Migration
  def change
    add_column :certificates, :conversation_id, :integer
  end
end
