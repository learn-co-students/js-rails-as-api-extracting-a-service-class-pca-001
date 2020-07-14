class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
#     render json: sightings.to_json(:include => {
#       :bird => {:only => [:name, :species]},
#       :location => {:only => [:latitude, :longitude]}
#   }, :except => [:updated_at])
# replace the original render statements with our new service class:
    render json: SightingSerializer.new(sightings).to_serialized_json
  end

  def show
    @sighting = Sighting.find(params[:id])
    render json: SightingSerializer.new(sightings).to_serialized_json
  end
end
