# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_s = URI.open(url).read
movies = JSON.parse(movies_s)['results'].sample(5)
movies.each do |movie|
  original_title = movie['original_title']
  overviews = movie['overview']
  poster = movie['poster_path']
  image_url = "https://image.tmdb.org/t/p/w500#{poster}"
  vote_average = movie['vote_average']

  Movie.create(
    title: original_title,
    overview: overviews,
    poster_url: image_url,
    rating: vote_average
  )
end
