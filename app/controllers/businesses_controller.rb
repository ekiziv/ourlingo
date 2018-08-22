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
    # This is the case we have it in our datebase
    @business = Business.find(params[:id])
    @client = GooglePlaces::Client.new(ENV['GOOGLE_API_SERVER_KEY'])
    @info = @client.spots(@business.latitude, @business.longitude,  { name: @business.name, address: @business.address, detail: true}).first
    @url = @info.photos[0].fetch_url(760)
  end
end
