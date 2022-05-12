Class Book
attr_accessor :title, :author, :rental

def initialize(title, author)
  @title = title
  @author = author
  @rentals = []
end

def add_rental(book)
  @rentals.push(book)
  book.rentals = self
end
