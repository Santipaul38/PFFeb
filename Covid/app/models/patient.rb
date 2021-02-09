class Patient < ActiveResource::Base
    self.site = "http://localhost:3001"

    belongs_to :test_group
	has_many :infected
    belongs_to :infectant
    delegate :first_name, :document_number, 
     to: :infectant, 
     prefix: true,
     allow_nil: true

     def statusP
     	status = ""

     	case self.status
     	when 1
     		status = "Isolated"
     	when 2
     		status = "Asymptomatic"
     	when 3
     		status = "Positive"
     	when 4
     		status = "Discharged"
     	end

     	status
     	
     end

     def provinceP
        s = ""
        case self.province
            when 1
                s = "Buenos Aires"
            when 2
                s = "Catamarca"
            when 3
                s = "Chaco"
            when 4
                s = "Chubut"
            when 5
                s = "Cordoba"
            when 6
                s = "Corrientes"
            when 7
                s = "Entre Rios"
            when 8
                s = "Formosa"
            when 9
                s = "Jujuy"
            when 10
                s = "La Pampa"
            when 11
                s = "La Rioja"
            when 12
                s = "Mendoza"
            when 13
                s = "Misiones"
            when 14
                s = "Neuquen"
            when 15
                s = "Rio Negro"
            when 16
                s = "Salta"
            when 17
                s = "San Juan"
            when 18
                s = "San Luis"
            when 19
                s = "Santa Cruz"
            when 20
                s = "Santa Fe"
            when 21
                s = "Santiago del Estero"
            when 22
                s = "Tierra del Fuego"
            when 23
                s = "Tucuman"
        end
        s
    end

    def self.test_size
        groups = []

        for g in TestGroup.all
            count = 0
            for i in Patient.all
                if g == i.test_group
                    count = count + 1
                end
            end
            if count < g.max_applicants
                groups.push(g)
            end
        end

        groups
    end

    def age
        age = 0
        if Time.now.month > self.birth_date.month
            age = Time.now.year - self.birth_date.year

        elsif Time.now.month < self.birth_date.month
            age = Time.now.year - self.birth_date.year - 1

        elsif Time.now.month == self.birth_date.month

            if Time.now.day >= self.birth_date.day
                age = Time.now.year - self.birth_date.year

            elsif Time.now.day < self.birth_date.day
                age = Time.now.year - self.birth_date.year - 1
            
            end   
        end
        age
    end
end
