class Train
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]

  end
end
