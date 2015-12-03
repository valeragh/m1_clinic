class StaticPagesController < ApplicationController
  def about
    @clinics = Clinic.all
    @hash = Gmaps4rails.build_markers(@clinics) do |clinic, marker|
      marker.lat clinic.latitude
      marker.lng clinic.longitude
      marker.infowindow clinic.description
    end
  end

  def contact
    @clinics = Clinic.all
    @hash = Gmaps4rails.build_markers(@clinics) do |clinic, marker|
      marker.lat clinic.latitude
      marker.lng clinic.longitude
      marker.infowindow clinic.description
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

  def robots
    robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end

end
