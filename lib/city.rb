class City
  attr_reader(:name,:id)


  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:==) do |another_city|
    self.name().==(another_city.name())
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

  define_method(:save) do
    result = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |identification|
    found_city = nil
    City.all().each() do |city|
      if city.id() == identification
        found_city = city
      end
    end
    found_city
  end
end
