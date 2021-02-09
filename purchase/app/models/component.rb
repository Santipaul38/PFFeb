class Component < ActiveResource::Base
	self.site = "http://localhost:3001"
	
	belongs_to :brand
	has_many :item_carts

	def self.filtermodel(model)
        components = []

        model = model.downcase

        for v in Component.all
            ap = v.model.downcase
            if ap.include?(model)
                components.push(v)
            end
        end

        components
        
    end

    def self.filtertype(type)
        components = []

        type = type.downcase

        for v in Component.all
            ap = v.category.downcase
            if ap.include?(type)
                components.push(v)
            end
        end

        components
        
    end

    def self.filterserial(serial)
        components = []

        serial = serial.downcase

        for v in Component.all
            ap = v.serial_number.downcase
            if ap.include?(serial)
                puts v.serial_number
                components.push(v)
            end
        end

        components
    end

end
