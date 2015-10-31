class ProceduresController < ApplicationController
  def index
    @service_categories = ServiceCategory.order(:tail)
  end

  def show
    @service_category = ServiceCategory.friendly.find(params[:service_category_id])
    @services = @service_category.services.order(:tail)
  end

  def show_procedur
    @service_category = ServiceCategory.friendly.find(params[:service_category_id])
    @service = @service_category.services.friendly.find(params[:id])
  end
end
