require('spec_helper')

describe('Train') do
  describe('#name') do
    it('will show the name of the train') do
      new_train = Train.new({:name => "South"})
      expect(new_train.name()).to(eq("South"))
    end
  end

  describe('.all') do
    it('will initiaily return an empty array of trains') do
      expect(Train.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save the train into the train list') do
      new_train = Train.new({:name => "South"})
      new_train.save()
      expect(Train.all()).to(eq([new_train]))
    end
  end

  describe('.find') do
    it('will find the train based on the id number') do
      new_train = Train.new({:name => "South"})
      new_train.save()
      new_train2 = Train.new({:name => "North"})
      new_train2.save()
      expect(Train.find(new_train2.id())).to(eq(new_train2))
    end
  end

  describe('#update') do
    it('will let you update train name in the database') do
      new_train = Train.new({:name => "South"})
      new_train.save()
      new_train.update({:name => "East"})
      expect(new_train.name()).to(eq("East"))
    end
  end

  describe('#delete') do
    it('lets you delete a train from the database') do
      new_train = Train.new({:name => "South"})
      new_train.save()
      new_train2 = Train.new({:name => "North"})
      new_train2.save()
      new_train.delete()
      expect(Train.all()).to(eq([new_train2]))
    end
  end
end
