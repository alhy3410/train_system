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

  describe('#update') do
    it('will let you update city name in the database') do
      new_city = City.new({:name => "Portland"})
      new_city.save()
      new_city.update({:name => "Eugene"})
      expect(new_city.name()).to(eq("Eugene"))
    end

    it('will let you add an train to a city') do
      new_city = City.new({:name => "Portland"})
      new_city.save()
      new_train = Train.new({:name => "South"})
      new_train.save()
      new_train2 = Train.new({:name => "North"})
      new_train2.save()
      new_city.update({:trains_id => [new_train.id(), new_train2.id()]})
      expect(new_city.trains()).to(eq([new_train, new_train2]))
    end
  end

  describe('#trains') do
    it('returns all trains for that particular city') do
      new_city = City.new({:name => "Portland"})
      new_city.save()
      new_train = Train.new({:name => "South"})
      new_train.save()
      new_train2 = Train.new({:name => "North"})
      new_train2.save()
      new_city.update({:trains_id => [new_train.id(), new_train2.id()]})
      expect(new_city.trains()).to(eq([new_train, new_train2]))
    end
  end



  describe('#delete') do
    it('lets you delete a city from the database') do
      new_city = City.new({:name => "Portland"})
      new_city.save()
      new_city2 = City.new({:name => "Seattle"})
      new_city2.save()
      new_city.delete()
      expect(City.all()).to(eq([new_city2]))
    end
  end
end
