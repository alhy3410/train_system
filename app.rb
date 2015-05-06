require('sinatra')
require('sinatra/reloader')
require('./lib/train')
require('./lib/city')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'train_system'})

get('/') do
  @trains = Train.all()
  @cities = City.all()
  erb(:index)
end

get('/trains') do
  @trains = Train.all()
  erb(:trains)
end

post('/trains') do
  name = params.fetch('name')
  train = Train.new({:name => name, :id => nil})
  train.save()
  @trains = Train.all()
  erb(:trains)
end



get('/cities') do
  @cities = City.all()
  erb(:cities)
end

post('/cities') do
  name = params.fetch('name')
  city = City.new({:name => name, :id => nil})
  city.save()
  @cities = City.all()
  erb(:cities)
end

get('/cities/:id') do
  @city = City.find(params.fetch('id').to_i())
  @trains = Train.all()
  erb(:city_info)
end


get('/trains/:id') do
  @train = Train.find(params.fetch('id').to_i())
  @cities = City.all()
  erb(:train_info)
end

patch('/trains/:id') do
  train_id = params.fetch("id").to_i()
  @train = Train.find(train_id)
  cities_ids = params.fetch('city_ids')
  @train.update({:cities_id => cities_ids})
  @cities = City.all()
  erb(:train_info)
end

patch('/cities/:id') do
  cities_id = params.fetch("id").to_i()
  @city = City.find(cities_id)
  trains_ids = params.fetch('train_ids')
  @city.update({:trains_id => trains_ids})
  @trains = Train.all()
  erb(:city_info)
end
