class Patient < ActiveRecord::Base
	belongs_to :test_group
	has_many :infected, class_name: 'Patient', foreign_key: :patient_id
    belongs_to :infectant, class_name: 'Patient', foreign_key: :patient_id, optional: true
    delegate :first_name, :document_number, 
     to: :infectant, 
     prefix: true,
     allow_nil: true
     
end
