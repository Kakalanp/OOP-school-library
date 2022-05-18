require './person_class'

class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def add_json_teacher
    JSON.generate([2, @age, @specialization, @name])
  end
end
