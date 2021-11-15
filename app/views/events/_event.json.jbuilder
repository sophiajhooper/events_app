json.extract! event, :id, :name, :host_id, :start, :end, :address, :details,
              :photo, :created_at, :updated_at
json.url event_url(event, format: :json)
