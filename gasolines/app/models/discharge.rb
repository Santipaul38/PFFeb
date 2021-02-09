class Discharge < ActiveResource::Base
    self.site = "http://localhost:3001/"

    belongs_to :station
    belongs_to :load
end
