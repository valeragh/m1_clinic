class StaticPagesController < ApplicationController
  def about
    @clinics = Clinic.all
    @hash = Gmaps4rails.build_markers(@clinics) do |clinic, marker|
      marker.lat clinic.latitude
      marker.lng clinic.longitude
      marker.infowindow clinic.description
      marker.picture({
        "url" => view_context.image_url('map-marker_150x150.png'),
        "width" => 150,
        "height" => 150})
    end
  end

  def contact
    @clinics = Clinic.all
    @hash = Gmaps4rails.build_markers(@clinics) do |clinic, marker|
      marker.lat clinic.latitude
      marker.lng clinic.longitude
      marker.infowindow clinic.description
      marker.picture({
        "url" => view_context.image_url('map-marker_150x150.png'),
        "width" => 150,
        "height" => 150})
    end
  end

  def price
  end

  def privacy
  end

  def doctors
  end

  def laboratory
  end

  def history
  end

  def administration
  end

  def sitemap
    path = Rails.root.join("public", "sitemaps", "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end

end
