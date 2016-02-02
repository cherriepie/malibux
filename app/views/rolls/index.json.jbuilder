json.array!(@rolls) do |roll|
  json.extract! roll, :id, :name
  json.url roll_url(roll, format: :json)
end
