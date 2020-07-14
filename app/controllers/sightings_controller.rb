class SightingsController < ApplicationController
    def index
      sightings = Sighting.all
      render json: SightingSerializer.new(sightings).to_serialized_json
    end

    def show
        options = {
            include: {
              bird: {
                only: [:name, :species]
              },
              location: {
                only: [:latitude, :longitude]
              }
            },
            except: [:updated_at],
          }
          @sighting.to_json(options)
    end
  end