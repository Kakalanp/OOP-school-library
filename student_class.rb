require './person_class'

Class Student < Person
def initialize(classroom)
  super
  @classroom = classroom
end

def play_hooky
  "¯\(ツ)/¯"
end
