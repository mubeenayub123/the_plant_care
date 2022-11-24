json.extract! complaint, :id, :title, :description, :status, :user_id, :irrigation_system_id, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
