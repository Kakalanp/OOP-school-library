require './classroom_class'

describe Classroom do
  before(:each) do
    @class = Classroom.new('SB')
  end

  describe '#label' do
    it 'creates a classroom with the label' do
      @class.label.should eql 'SB'
    end
  end
end
