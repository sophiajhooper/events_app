json.extract! comment, :id, :event_id, :commenter_id, :comment_text,
              :created_at, :updated_at
json.url comment_url(comment, format: :json)
