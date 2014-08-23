json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :progress, :link
  json.url project_url(project, format: :json)
end
