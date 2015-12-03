ActiveAdmin.register Certificate do

  actions :index, :show, :destroy

  filter :user, label: "Пользователь", as: :select, collection: proc { User.find(Certificate.pluck(:user_id)).map { |m| [m.name, m.id] } }
  filter :conversation, label: "Доктор Онлайн", as: :select, collection: proc { Conversation.find(Certificate.pluck(:conversation_id)).map { |m| [m.recipient.name, m.id] } }
  filter :created_at
  filter :updated_at

  index do
    column("Создано"){|certificate| l certificate.created_at, format: :long}
    column("Изображения"){|certificate| image_tag certificate.image_url.thumb.url}
    column("Пользователь"){|certificate| certificate.user.name}
    column("Доктор Онлайн"){|certificate| certificate.conversation.recipient.name}
    actions
  end

  show title: :id do
    panel "Данные" do
      attributes_table_for certificate do
        row('Изображение') do
          image_tag certificate.image_url.thumb.url
        end
      end
    end
    active_admin_comments
  end

   sidebar "Детали", only: :show do
    attributes_table_for certificate do
      row('Создано') { |b| l certificate.created_at, format: :long}
      row("Пользователь"){|b| certificate.user.name}
      row("Доктор Онлайн"){|b| certificate.conversation.recipient.name}
    end
  end

end
