class BusinessesController < ApplicationController

  def index
    @businesses = Business.where.not(latitude: nil, longitude: nil)

    @markers = @businesses.map do |business|
      {
        lat: business.latitude,
        lng: business.longitude,
      }
    end
  end

  def show
    @business = Business.find(params[:id])
  end
end
