class ToonsController < ApplicationController
    def index
        toons = Toon.all
        render json: toons
    end
    def create
        toon = Toon.create(toon_params)
        render json: toon
    end


    private
    def toon_params
        params.require(:toon).permit(:name, :age, :enjoys_doing, :image)
    end
end
