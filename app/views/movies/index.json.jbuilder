json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :release_date, :plot, :cover
  json.url movie_url(movie, format: :json)
end
