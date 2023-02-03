# README

* request spec update

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