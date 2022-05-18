require './person_class'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classrooms(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_json_student
    JSON.generate([1, @age, @classroom, @parent_permission, @name])
  end
end
