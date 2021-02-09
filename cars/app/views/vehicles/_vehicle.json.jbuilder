json.extract! vehicle, :id, :patent, :brand, :model, :fuel_type, :engine_code, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
