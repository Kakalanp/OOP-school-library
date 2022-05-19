require './teacher_class'

describe Teacher do
  before :each do
    @teacher = Teacher.new(50, 'Chemistry', 'James')
  end

  describe '#new' do
    it 'return a new teacher object' do
      @teacher.should be_an_instance_of Teacher
    end
  end

  describe '#age' do
    it 'returns the correct specialization' do
      @teacher.age.should eql 50
    end
  end
end
