class SightingSerializer
  def initialize(sighting_object) #initialize will take in whatever variable we're dealing with in a particular action, and store it as an instance variable
    @sighting = sighting_object #whatever we pass when initializing a new instance of SightingSerializer will be stored as @sighting
  end

  # def to_serialized_json
  #   @sighting.to_json(:include => { (call to_json on this instance variable)
  #     :bird => {:only => [:name, :species]}, (handling the inclusion and exclusion of attributes, and return the results)
  #     :location => {:only => [:latitude, :longitude]} (logic that existed in SightingsController)
  #   }, :except => [:updated_at])
  # end
  #above rewritten as:
  def to_serialized_json
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