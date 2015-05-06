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
  
end
