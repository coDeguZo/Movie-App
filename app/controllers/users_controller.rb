class UsersController < ApplicationController

    def index
        users = User.all
        render json: users.as_json(include: [:favorites, :movies])
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user, include: [:favorites, :movies]
    end

end
