require './book_class'

describe 'Book' do
  before(:each) do
    @book = Book.new('12 Rules for life', 'Jordan B. Peterson')
  end

  it 'creates a book with the correct parameters' do
    expect(@book.title).to eq('12 Rules for life')
    expect(@book.author).to eq('Jordan B. Peterson')
  end

  it 'Is an instance of Rental' do
    @book.should be_an_instance_of Book
  end

  describe '#name' do
    it 'returns the correct author' do
      @book.author.should eql 'Jordan B. Peterson'
    end
  end
end
