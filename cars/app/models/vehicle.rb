class Vehicle < ApplicationRecord
	has_many :services
	
	validates :patent, :brand, :model, :fuel_type, :engine_code, presence: true
end
