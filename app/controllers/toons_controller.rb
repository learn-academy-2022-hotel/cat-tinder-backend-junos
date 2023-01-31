class ToonsController < ApplicationController
    def index
        toons = Toon.all
        render json: toons
    end
    def create
        toon = Toon.create(toon_params)
        if toon.valid?
            render json: toon
        else
            render json: toon.errors, status: 422
        end
    end


    private
    def toon_params
        params.require(:toon).permit(:name, :age, :enjoys_doing, :image)
    end
end
