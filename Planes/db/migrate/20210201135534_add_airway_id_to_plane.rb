class AddAirwayIdToPlane < ActiveRecord::Migration[6.1]
  def change
    add_reference :planes, :airway, null: false, foreign_key: true
  end
end
