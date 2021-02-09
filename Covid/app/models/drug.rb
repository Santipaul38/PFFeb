class Drug < rails ActiveResource::Base
  	self.site = "http://localhost:3001"
  	
	has_many :test_groups
end
