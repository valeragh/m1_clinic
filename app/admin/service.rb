ActiveAdmin.register Service do

  permit_params :name, :tail, :image_url, :image_small_url, :price, :description, :service_category_id
  before_filter :find_resource, :only => [:show, :edit, :update, :destroy]
  actions :all

  filter :name, label: 'Название услуги'
  filter :tail, label: 'Приоритет'
  filter :service_category, label: 'Категория', as: :select, collection: proc { ServiceCategory.find(Service.pluck(:service_category_id)).map { |m| [m.name, m.id] } }
  filter :created_at, label: 'Дата создания'

  form do |f|
    f.inputs 'Название услуги' do
      f.input :name
    end
    f.inputs 'Приоритет' do
      f.input :tail
    end
    f.inputs 'Категория' do
      f.input :service_category_id, as: :select, collection: ServiceCategory.all.map { |m| [m.name, m.id] }
    end
    f.inputs 'Стоимость' do
      f.input :price
    end
    f.inputs 'Описание услуги' do
      f.input :description, as: :wysihtml5, commands: [ :bold, :italic, :underline, :ul, :ol, :outdent, :indent ], blocks: :basic
    end
    f.inputs 'Изображение большое 1600X800', :multipart => true do
      f.input :image_url
    end
    f.inputs 'Изображение маленькое 533Х280', :multipart => true do
      f.input :image_small_url
    end
    f.actions
  end

  show title: :name do
    panel "Данные" do
      attributes_table_for service do
        row('Описание услуги') { |b| service.description.html_safe}
        row('Изображение большое') do
          image_tag service.image_url
        end
        row('Изображение маленькое') do
          image_tag service.image_small_url
        end
      end
    end
    active_admin_comments
  end

   sidebar "Детали", only: :show do
    attributes_table_for service do
      row('Приоритет') { |b| service.tail}
      row("Стоимость"){|b| service.price}
      row("Категория"){|b| service.service_category.name}
    end
  end

  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  index do
    column("Название"){|service| service.name}
    column("Категория"){|service| service.service_category.name}
    column("Приоритет"){|service| service.tail}
    column("Стоимость"){|service| service.price}
    column "Дата создания", :created_at
    actions
  end


end
