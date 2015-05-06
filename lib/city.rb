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

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{@id};")

    attributes.fetch(:trains_id, []).each() do |train|
      DB.exec("INSERT INTO stops (trains_id, cities_id) VALUES ('#{train}', #{self.id()});")
    end
  end

  define_method(:delete) do
    @id = self.id()
    DB.exec("DELETE FROM cities WHERE id = #{@id}")
  end

  define_method(:trains) do
    stops = []
    results = DB.exec("SELECT trains_id FROM stops WHERE cities_id =#{self.id()};")
    results.each() do |result|
      train_id = result.fetch("trains_id").to_i()
      train = DB.exec("SELECT * FROM trains WHERE id = '#{train_id}';")
      name = train.first().fetch("name")
      stops.push(Train.new({:name => name, :id => train_id}))
    end
    stops
  end
end
