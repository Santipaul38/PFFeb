class Load < ActiveResource::Base
    self.site = "http://localhost:3001/"

    has_many :discharges
    belongs_to :truck

    validate :count_liters

    def count_liters
    	countL = 0
    	countD = 0

    	for l in Load.all
    		if l.truck == self.truck
    			countL = countL + l.liters
    			for d in Discharge.all
    				if d.load == l
    					countD = countD + d.liters
    				end
    			end
    		end
    	end

    	if self.truck.max_liters.to_i == (countL - countD).to_i
    		errors.add(:truck, " | Truck is full | ")

    	elsif (countL - countD).to_i < self.truck.max_liters.to_i and self.liters.to_i > (self.truck.max_liters.to_i - (countL - countD).to_i)
    		errors.add(:liters, "exceed free space")
    	end
    end
end
