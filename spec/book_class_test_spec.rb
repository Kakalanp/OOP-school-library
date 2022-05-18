require './book_class'

describe 'Book' do
  it 'creates a book with the correct parameters' do
    book = Book.new('12 Rules for life', 'Jordan B. Peterson')

    expect(book.title).to eq('12 Rules for life')
  end
end
