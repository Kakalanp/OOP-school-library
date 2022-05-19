require './rental_class'
require './person_class'
require './book_class'

describe 'Rental' do
  before(:each) do
    @book = Book.new('12 Rules for life', 'Jordan B. Peterson')
    @person = Person.new(22, 'Joaquin')
    @rental = Rental.new('2022/05/19', @book, @person)
  end

  it 'creates a rental with the correct parameters' do
    expect(@rental.date).to eq('2022/05/19')
    expect(@rental.book).to eq(@book)
    expect(@rental.person).to eq(@person)
  end

  it 'Is an instance of Rental' do
    @rental.should be_an_instance_of Rental
  end
end
