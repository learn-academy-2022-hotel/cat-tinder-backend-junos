require 'rails_helper'

RSpec.describe "Toons", type: :request do
  describe "GET /index" do
    it 'displays all toons' do
      Toon.create(
        name: 'Patrick',
        age: 35,
        enjoys_doing: 'Sleeping under rock',
        image: 'www.patrick.com'
      )

      get '/toons'
      toon = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(toon.length).to eq(1)

    end
  end

  describe "POST /create" do
    it 'creates a toon' do
      toon_params = {
        toon: {
          name: 'Patrick',
          age: 35,
          enjoys_doing: 'Sleeping under rock',
          image: 'www.patrick.com'
        }
      }

      post '/toons', params: toon_params

      expect(response).to have_http_status(200)

      toon = Toon.first
      expect(toon.name).to eq('Patrick')
    end

    it 'will not create a toon without a name' do
      toon_params = {
        toon: {
          age: 35,
          enjoys_doing: 'sleeping under rock',
          image: 'www.com'
        }
      }
      # conditional http status

      post '/toons', params: toon_params

      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      # p response.body
      expect(json["name"]).to include "can't be blank"

    end
    it 'will not create a toon without a age' do
      toon_params = {
        toon: {
          name: 'Patrick',
          enjoys_doing: 'sleeping under rock',
          image: 'www.com'
        }
      }
      # conditional http status

      post '/toons', params: toon_params

      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      # p response.body
      expect(json["age"]).to include "can't be blank"

    end
    it 'will not create a toon without an enjoys_doing' do
      toon_params = {
        toon: {
          name: 'Patrick',
          age: 35,
          image: 'www.com'
        }
      }
      # conditional http status

      post '/toons', params: toon_params

      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      # p response.body
      expect(json["enjoys_doing"]).to include "can't be blank"

    end
    it 'will not create a toon without an image' do
      toon_params = {
        toon: {
          name: 'Patrick',
          age: 35,
          enjoys_doing: 'sleeping under rock'
        }
      }
      # conditional http status

      post '/toons', params: toon_params

      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      # p response.body
      expect(json["image"]).to include "can't be blank"

    end
  end
end
