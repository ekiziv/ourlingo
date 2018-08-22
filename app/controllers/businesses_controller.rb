require 'uri'

class BusinessesController < ApplicationController

  def index
    @businesses = Business.where.not(latitude: nil, longitude: nil)

    @markers = @businesses.map do |business|
      {
        lat: business.latitude,
        lng: business.longitude,
      }
    end
    @query = params[:input_address]
    @formatted_query = URI.encode(@query)
    # url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{@formatted_query}&inputtype=textquery&fields=photos,formatted_address,name,rating&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    #url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?query=#{@formatted_query}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?input=#{@formatted_query}&inputtype=textquery&fields=photos,formatted_address,name,rating&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    places = HTTParty.get(url)
    @candidates = places["results"]


  end

  def show
    @business = Business.find(params[:id])
    # url = URI::HTTP.build(path: "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?", input: "#{@business.address}", inputtype:"textquery", fields: "photos,formatted_address,name,rating", key: "")
    # uri = URI.parse(URI.escape(url))
    # response = RestClient.get uri
    # @info = JSON.parse(response)
    # @info = HTTP.get(url)
    @query = params[:input_address]

    # we could be using this approach
    @client = GooglePlaces::Client.new(ENV['GOOGLE_API_SERVER_KEY'])
    @info = @client.spots(@business.latitude, @business.longitude,  { name: @business.name, address: @business.address, detail: true})
    # @url = @info.photos[0].fetch_url(760)

    # Add a link in case the search result is not correct
  end
end
