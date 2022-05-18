class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end

  def add_json_rental(book_id, person_id)
    JSON.generate([@date, book_id, person_id])
  end
end
