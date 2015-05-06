class City
  attr_reader(:name)


  define_method(:initialize) do |attributes|
    @name = attributes[:name]
  end

  define_singleton_method(:all) do
    all_cities = DB.exec("SELECT * FROM cities;")
    cities_list = []
    all_cities.each() do |city|
      name = city.fetch('name')
      id = city.fetch('id').to_i()
      cities_list.push(City.new({:name => name, :id => id}))
    end
    cities_list
  end

end
