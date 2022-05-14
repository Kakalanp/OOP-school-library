class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize
    @label = label
    @students = []
  end

  def add_student
    @students.push(student)
    student.classroom = self
  end
end
