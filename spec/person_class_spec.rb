require './person_class'

describe Person do
	before :each do
		@person = Person.new(@age, @name)
	end


	describe "#new" do
		it "return a new person object" do
			@person.should be_an_instance_of Person
		end
	end
end