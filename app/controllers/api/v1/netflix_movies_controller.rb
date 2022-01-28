require 'csv'
class Api::V1::NetflixMoviesController < Api::V1::BaseController
  def create_by_csv
    CSV.foreach(Rails.root.join('lib/netflix_titles.csv'), headers: true) do |row|
      netflix = NetflixMovie.create(
                      title: row['title'],
                      genre: row['listed_in'],
                      year: row['release_year'].to_i,
                      country: row['country'],
                      published_at: row['date_added'],
                      description: row['description']
                      )
      puts "Created #{netflix.title}"
      end
  end

  def index
    if params["search"].present?
      @netflix_movies = NetflixMovie.search(params["search"])
    else
      @netflix_movies = NetflixMovie.all.order(:year)
    end
    render json: @netflix_movies.to_json(:except => [:created_at, :updated_at])
  end
end
