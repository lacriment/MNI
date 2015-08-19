json.array!(@people) do |person|
  json.extract! person, :id, :full_name, :photo
  json.url person_url(person, format: :json)
end
