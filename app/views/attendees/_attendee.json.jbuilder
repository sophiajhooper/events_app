json.extract! attendee, :id, :event_id, :attendee_id, :status, :created_at,
              :updated_at
json.url attendee_url(attendee, format: :json)
