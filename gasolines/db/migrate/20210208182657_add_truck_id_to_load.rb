class AddTruckIdToLoad < ActiveRecord::Migration[6.1]
  def change
    add_reference :loads, :truck, null: false, foreign_key: true
  end
end
