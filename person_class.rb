require './decorator'

class Person < Nemeable
  attr_accessor :name, :age, :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    true if is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
