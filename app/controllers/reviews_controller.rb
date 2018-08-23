require 'uri'
class ReviewsController < ApplicationController
  def index
    query = params[:input_address]
    formatted_query = URI.encode(query)
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?input=#{formatted_query}&inputtype=textquery&fields=photos,formatted_address,name,rating&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    places = HTTParty.get(url)
    @candidates = places["results"]
  end

  def show
    place_id = params[:id]
    url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&fields=formatted_address,name,photos,rating,formatted_phone_number&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    place_info = HTTParty.get(url)
    @result = place_info["result"]
  end
end
