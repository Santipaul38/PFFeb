class TestGroup < ApplicationRecord
	belongs_to :drug
	has_many :patients

	def patientCount
		count = 0
    	for i in Patient.all
      		if i.test_group == self
      			count = count + 1
      		end
      	end

      	return count

  	end
end
