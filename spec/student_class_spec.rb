require './student_class'

describe Student do
  before :each do
    @student = Student.new(10, 'AB', true, 'Richard')
  end

  describe '#new' do
    it 'return a new person object' do
      @student.should be_an_instance_of Student
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @student.name.should eql 'Richard'
    end
  end
end
