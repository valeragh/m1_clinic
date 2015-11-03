ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do

      column do

        panel "Письма" do
          table_for Letter.order(created_at: :desc).limit(10) do
            column("Дата создания"){|letter| l letter.created_at, format: :short}
            column("Имя"){|letter| letter.name }
            column("Телефон"){|letter| letter.name }
            column("Email"){|letter| letter.email}
            column("Сообщение"){|letter| letter.description}
            column("Статус"){|letter| status_tag(letter.state)}
          end
        end

      end
    end
  end # content
end
