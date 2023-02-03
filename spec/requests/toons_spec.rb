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

  describe 'PATCH /update/:id' do
    it 'will update a whole toon info' do
      toon_params = {
        toon: {
          name: 'Buster',
          age: 4,
          enjoys_doing: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      post '/toons', params: toon_params
      expect(response).to have_http_status(200)
      toon = Toon.first
      expect(toon.name).to eq 'Buster'

      toon_updated_params = {
        toon: {
          id: 1,
          name: 'Not Buster',
          age: 4,
          enjoys_doing: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      patch "/toons/#{toon_updated_params.toon.id}", params: toon_updated_params
      expect(response).to have_http_status(200)
      toon = Toon.first
      expect(toon.name).to eq 'Not Buster'
    end
  end
  
end



# let(:toon) do
#   Toon.create!(    
#       id: 1,  
#       name: 'Buster',
#       age: 4,
#       enjoys_doing: 'Meow Mix, and plenty of sunshine.',
#       image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
#   )
# end
  
# # context 'with valid parameters' do
# let(:params) do 
#   {
#     toon: {
#       id: 1,
#       name: 'NEW BUSTER',
#       age: 4,
#       enjoys_doing: 'Meow Mix, and plenty of sunshine.',
#       image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
#     }
#   }
# end


# it 'will update a whole toon info' do
#   # put "/api/v1/toons/#{toon.id}", params: params
#   # expect { toon.reload }.to change(toon, :name).to("NEW BUSTER")
#   put "/toons/1", params: { id: toon, toon: params }
#   expect(toon.name).to eq('NEW BUSTER')
#   expect(response.status).to eq 200
#   toon.reload!
# end
    
# end