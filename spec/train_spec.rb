require('spec_helper')

describe('Train') do
  describe('#name') do
    it('will show the name of the train') do
      new_train = Train.new({:name => "South"})
      expect(new_train.name()).to(eq("South"))
    end
  end
end
