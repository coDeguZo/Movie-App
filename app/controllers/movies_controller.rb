class MoviesController < ApplicationController
    def index
        render json: Movie.all.as_json(include: [:favorites, :users])
    end

    def show
        movie = Movie.find_by(id: params[:id])
        render json: movie, include: [:favorites, :users]
    end

end
