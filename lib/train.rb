class Train
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
  end

  define_singleton_method(:all) do
    all_trains = DB.exec("SELECT * FROM trains;")
    trains_list = []
    all_trains.each() do |train|
      name = train.fetch('name')
      id = train.fetch('id').to_i()
      trains_list.push(Train.new({:name => name, :id => id}))
    end
  trains_list
  end
  
end
