require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/places')

get('/') do
  @places = Place.all()
  erb(:index)
end

post('/success') do
  place_name = params[:place_name]
  place = Place.new(place_name)
  place.save()
  erb(:success)
end
