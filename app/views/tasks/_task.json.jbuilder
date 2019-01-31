json.extract! task, :id, :title, :description, :user_id, :assignee, :status, :priority, :created_at, :updated_at
json.url task_url(task, format: :json)
