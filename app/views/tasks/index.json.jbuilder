json.array!(@tasks) do |task|
  json.extract! task, :id, :project_id, :assignee_id, :description, :name, :status, :creator_id
  json.url task_url(task, format: :json)
end
