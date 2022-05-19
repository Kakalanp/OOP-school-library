require './teacher_class'

describe Teacher do
  before :each do
    @teacher = Teacher.new(@age, @specialization, @name)
  end

  describe '#new' do
    it 'return a new teacher object' do
      @teacher.should be_an_instance_of Teacher
    end
  end
end
