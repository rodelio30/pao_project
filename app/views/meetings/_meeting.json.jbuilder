json.extract! meeting, :id, :client_name, :start_time, :end_time, :user_id, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
