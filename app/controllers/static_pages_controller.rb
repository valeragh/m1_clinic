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

  def servis
  end

  def news
  end

  def certificate
  end

  def doctors
  end

  def laboratory
  end

  def history
  end

  def administration
  end

  def partners
  end
end
