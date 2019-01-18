require 'uri'
class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
    @user_lat = params[:search_lat]
    @user_lng = params[:search_lng]
    query = params[:input_address] || params[:input_addr]

    @places = sort_places(lookup(@user_lat, @user_lng, query))

    @markers = @places.map do |place|
      {
        card_id: "card_#{place['place_id']}",
        lat: place.geometry['location']['lat'],
        lng: place.geometry['location']['lng'],
        icon: ActionController::Base.helpers.asset_path('marker.png')
      }
    end
  end

  def show
    @place_id = params[:id]
    url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{@place_id}&fields=geometry,formatted_address,name,rating,formatted_phone_number,opening_hours&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    place_info = HTTParty.get(url)
    result = place_info["result"]
    @name = result["name"].nil? ? "No name" : result["name"]
    @formatted_address = result["formatted_address"].nil? ? "No address specified" : result["formatted_address"]
    @formatted_phone_number = result["formatted_phone_number"].nil? ? "No phone specified" : result["formatted_phone_number"]
    @rating = result["rating"].nil? ? 0 : result["rating"]
    @openning_hours = result["openning_hours"].nil? ? "Opening hours are not specified" : result["opening_hours"]

    @reviews = Review.where(place_id: @place_id).find_each
    @markers = [{
      lat: result['geometry']['location']['lat'],
      lng: result['geometry']['location']['lng'],
      icon: ActionController::Base.helpers.asset_path('marker.png'),
    }]
  end

  def create
    @review = Review.new(review_params)
    @place_id = @review.place_id
    @reviews = Review.where(place_id: @place_id).find_each
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.js   # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:content, :place_id, :english_rating)
  end

  def sort_places(places)
    reviewed = []
    non_reviewed = []
    places.each do |place|
      review = Review.find_by(place_id: place.place_id)
      if review.nil?
        non_reviewed << place
      else
        reviewed << place
      end
    end
    reviewed = reviewed.sort_by! { |reviewed_place| Review.find_by(place_id: reviewed_place.place_id).english_rating }
    return reviewed.reverse! + non_reviewed
  end



  def lookup(user_lat, user_lng, query)
    formatted_query = URI.encode(query)
    location_helper = "location=#{user_lat},#{user_lng}"
    url = "https://maps.googleapis.com/maps/api/place/textsearch/json?#{location_helper}&input=#{formatted_query}&inputtype=textquery&fields=photos,formatted_address,name,rating&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    places = HTTParty.get(url)
    @places = places["results"].map do |place|
      OpenStruct.new(place)
    end
    return @places
  end

end
