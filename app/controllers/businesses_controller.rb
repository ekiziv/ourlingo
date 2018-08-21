class BusinessesController < ApplicationController

  def index
    @businesses = Business.all

    @businesses = Business.where.not(latitude: nil, longitude: nil)

    @markers = @businesses.map do |business|
      {
        lat: businesses.latitude,
        lng: businesses.longitude,

      }
    end
  end

  def show
    @business = Business.find(params[:id])
  end

end
