class Discharge < ActiveRecord::Base

	belongs_to :station
    belongs_to :load
    
end
