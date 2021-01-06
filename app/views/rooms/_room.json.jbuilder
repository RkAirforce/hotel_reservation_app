json.extract! room, :id, :user_id, :name, :new_room_img, :description, :price, :address, :created_at, :updated_at
json.url room_url(room, format: :json)
