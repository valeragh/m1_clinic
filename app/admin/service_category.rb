ActiveAdmin.register ServiceCategory do

  permit_params :name, :image_url, :image_small_url
  before_filter :find_resource, :only => [:show, :edit, :update, :destroy]
  actions :all

  filter :name, label: 'Название категории'
  filter :created_at, label: 'Дата создания'

  form do |f|
    f.inputs 'Название категории' do
      f.input :name
    end
    f.inputs 'Изображение большое 1684X893', :multipart => true do
      f.input :image_url
    end
    f.inputs 'Изображение маленькое 533X280', :multipart => true do
      f.input :image_small_url
    end
    f.actions
  end

  show title: :name do
    panel "Данные" do
      attributes_table_for service_category do
        row('Изображение маленькое') do
          image_tag service_category.image_small_url
        end
        row('Изображение большое') do
          image_tag service_category.image_url
        end
      end
    end
    active_admin_comments
  end

   sidebar "Детали", only: :show do
    table_for service_category.services do
      column("Услуги") do |service|
         link_to service.name, [ :admin, service ]
      end
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
    column("Название"){|service_category| service_category.name}
    column "Дата создания", :created_at
    actions
  end



end