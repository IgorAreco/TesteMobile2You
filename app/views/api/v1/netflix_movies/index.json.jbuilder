json.array! @netflix_movies do |netflix|
  json.extract! netflix, :id, :title, :genre, :year, :country, :published_at, :description
end
