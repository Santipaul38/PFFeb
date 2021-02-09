class AddPatientIdToPatient < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :patient, null: true, foreign_key: true
  end
end
