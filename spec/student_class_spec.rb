require './student_class'

describe Student do
  before :each do
    @student = Student.new(@age, @classroom, @parent_permission, @name)
  end

  describe '#new' do
    it 'return a new person object' do
      @student.should be_an_instance_of Student
    end
  end
end
