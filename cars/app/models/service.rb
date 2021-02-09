class Service < ApplicationRecord
	has_many :items
	belongs_to :vehicle
	
	validates :employee, presence: true

	def itemCount
		count = 0
    	for i in Item.all
      		if i.service == self
      			count = count + 1
      		end
      	end

      	return count

  	end

  	def itemCost
		cost = 0
    	for i in Item.all
      		if i.service == self
      			cost = cost + i.import
      		end
      	end
      	
      	return cost

  	end
end
