class Station < ActiveResource::Base
    self.site = "http://localhost:3001/"

    has_many :discharges

end
