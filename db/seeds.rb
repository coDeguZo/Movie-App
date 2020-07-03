# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

User.destroy_all
Movie.destroy_all
Favorite.destroy_all

m1 = RestClient.get 'https://api.themoviedb.org/3/movie/popular?api_key=9768b0f90e6feefe47874bc4d56a3b4c&language=en-US&page=1'
m2 = RestClient.get 'https://api.themoviedb.org/3/movie/popular?api_key=9768b0f90e6feefe47874bc4d56a3b4c&language=en-US&page=2'
m3 = RestClient.get 'https://api.themoviedb.org/3/movie/popular?api_key=9768b0f90e6feefe47874bc4d56a3b4c&language=en-US&page=3'
m4 = RestClient.get 'https://api.themoviedb.org/3/movie/popular?api_key=9768b0f90e6feefe47874bc4d56a3b4c&language=en-US&page=4'


m1_arr = JSON.parse(m1)["results"]
m2_arr = JSON.parse(m2)["results"]
m3_arr = JSON.parse(m3)["results"]
m4_arr = JSON.parse(m4)["results"]

m1_arr.each do |movie|
    x = RestClient.get "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=9768b0f90e6feefe47874bc4d56a3b4c&language=en-US"
    resp = JSON.parse(x)
    genres = []
    resp["genres"].each {|x| genres << x["name"]}
    Movie.create(
        title: resp["title"],
        backdrop_path: resp["backdrop_path"],
        adult: resp["adult"],
        overview: resp["overview"],
        poster_path: resp["poster_path"],
        release_date: resp["release_date"],
        runtime: resp["runtime"],
        imdb_id: resp["imdb_id"],
        tagline: resp["tagline"],
        original_language: resp["original_language"],
        genres: genres,
        tmdb_id: resp["id"]
    )
end

m2_arr.each do |movie|
    x = RestClient.get "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=9768b0f90e6feefe47874bc4d56a3b4c&language=en-US"
    resp = JSON.parse(x)
    genres = []
    resp["genres"].each {|x| genres << x["name"]}
    Movie.create(
        title: resp["title"],
        backdrop_path: resp["backdrop_path"],
        adult: resp["adult"],
        overview: resp["overview"],
        poster_path: resp["poster_path"],
        release_date: resp["release_date"],
        runtime: resp["runtime"],
        imdb_id: resp["imdb_id"],
        tagline: resp["tagline"],
        original_language: resp["original_language"],
        genres: genres,
        tmdb_id: resp["id"]
    )
end

m3_arr.each do |movie|
    x = RestClient.get "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=9768b0f90e6feefe47874bc4d56a3b4c&language=en-US"
    resp = JSON.parse(x)
    genres = []
    resp["genres"].each {|x| genres << x["name"]}
    Movie.create(
        title: resp["title"],
        backdrop_path: resp["backdrop_path"],
        adult: resp["adult"],
        overview: resp["overview"],
        poster_path: resp["poster_path"],
        release_date: resp["release_date"],
        runtime: resp["runtime"],
        imdb_id: resp["imdb_id"],
        tagline: resp["tagline"],
        original_language: resp["original_language"],
        genres: genres,
        tmdb_id: resp["id"]
    )
end

m4_arr.each do |movie|
    x = RestClient.get "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=9768b0f90e6feefe47874bc4d56a3b4c&language=en-US"
    resp = JSON.parse(x)
    genres = []
    resp["genres"].each {|x| genres << x["name"]}
    Movie.create(
        title: resp["title"],
        backdrop_path: resp["backdrop_path"],
        adult: resp["adult"],
        overview: resp["overview"],
        poster_path: resp["poster_path"],
        release_date: resp["release_date"],
        runtime: resp["runtime"],
        imdb_id: resp["imdb_id"],
        tagline: resp["tagline"],
        original_language: resp["original_language"],
        genres: genres,
        tmdb_id: resp["id"]
    )
end

user1 = User.create(name: "Uzoma Ariguzo", email: "uzo@gmail.com")

f1 = Favorite.create(user_id: user1.id, movie_id: Movie.last.id)
f2 = Favorite.create(user_id: user1.id, movie_id: Movie.first.id)
