class Cart < ActiveResource::Base
	self.site = "http://localhost:3001"
	
	has_many :item_carts

	def totalPrice
		price = 0
        for i in ItemCart.all
            if i.cart == self
                count = i.price
                price = price + count
            end
        end
        price
	end

	def self.filteruname(uname)
        brands = []

        uname = uname.downcase

        for v in Cart.all
            ap = v.user_name.downcase
            if ap.include?(uname)
                brands.push(v)
            end
        end

        brands
        
    end
	
    def self.filterfromto(from, to)
    	carts = []
		if (from == "" ) or (to == "")
			carts = Cart.all
		else
			from = from.to_date
			to = to.to_date
			for v in Cart.all
			    condition = 0
			    if (v.bill_date.to_date > from)
			        condition = condition + 1
			    end

			    if (v.bill_date.to_date < to)
			        condition = condition + 1
			    end

			    if (condition == 2)
			        carts.push(v)
			    end
			end
			carts
		end
    	
    end

    def self.filterprice(max)
    	carts = []
		if (max == "" )
			carts = Cart.all
		else
			max = max.to_f

			for i in Cart.all
	            if i.totalPrice < max
	               carts.push(i) 
	            end 
	        end

			carts
		end
    	
    end

    def self.filterbrand(brand_id)
    	carts = []

    	for c in Cart.all
    		for i in ItemCart.all
    			if i.cart == c and i.component.brand.id.to_i == brand_id.to_i
    				carts.push(c)
    			end
    		end
    	end

    	carts
    	
    end

    def self.filterperunit(min, max)
    	carts = []

    	min = min.to_f
    	max = max.to_f

    	for c in Cart.all
    		for i in ItemCart.all
    			if i.cart == c and i.unit_price >= min and i.unit_price <= max
    				count = 0
    				for j in carts
    					if j == c
    						count = count + 1
    					end
    				end
    				if count == 0
    					carts.push(c)
    				end
    			end
    		end
    	end

    	carts
    	
    end

end
