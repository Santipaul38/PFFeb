class Truck < ActiveResource::Base
    self.site = "http://localhost:3001/"

    has_many :loads

end
