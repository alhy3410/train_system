require('spec_helper')

describe('City') do
  describe('#name') do
    it('will show the name of the city') do
      new_city = City.new({:name => "Portland"})
      expect(new_city.name()).to(eq("Portland"))
    end
  end
end
