require('spec_helper')

describe('City') do
  describe('#name') do
    it('will show the name of the city') do
      new_city = City.new({:name => "Portland"})
      expect(new_city.name()).to(eq("Portland"))
    end
  end

  describe('.all') do
    it('will return an empty array to hold all cities') do
      expect(City.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will store the city into the city list') do
      new_city = City.new({:name => "Portland"})
      new_city.save()
      expect(City.all()).to(eq([new_city]))
    end
  end

  describe('.find') do
    it('will find the city using the id') do
      new_city = City.new({:name => "Portland"})
      new_city.save()
      new_city2 = City.new({:name => "Seattle"})
      new_city2.save()
      expect(City.find(new_city.id())).to(eq(new_city))
    end
  end
end
