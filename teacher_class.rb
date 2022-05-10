require './person_class'

Class Teacher < Person
def initialize(specialization)
  super
  @specialization = specialization
end

def can_use_services?
  true
end
