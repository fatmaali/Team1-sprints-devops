json.extract! ticket, :id, :name, :refrence, :price, :ids, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
