class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :document_number
      t.datetime :birth_date
      t.integer :provice
      t.string :city
      t.integer :status

      t.timestamps
    end
  end
end
