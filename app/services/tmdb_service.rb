require 'net/http'
require 'json'

class TmdbService
  TMDB_API_URL = 'https://tmdb.lewagon.com/movie/top_rated'

  def self.fetch_and_store_top_rated_movies
    uri = URI(TMDB_API_URL)
    response = Net::HTTP.get(uri)
    results = JSON.parse(response)
    if results['results'].is_a?(Array)
      results['results'].each do |movie_data|
        Movie.find_or_create_by(title: movie_data['title']) do |movie|
          movie.overview = movie_data['overview']
          movie.poster_url = "https://image.tmdb.org/t/p/w500#{movie_data['poster_path']}"
          movie.rating = movie_data['vote_average']
        end
      end
    end
  rescue JSON::ParserError, URI::InvalidURIError
    # Handle JSON parsing errors or URI errors
    []
  end
end
