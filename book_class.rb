require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(book)
    @rentals.push(book)
    book.rentals = self
  end

  def add_json_book
    json = JSON.generate([@title, @author])
    File.write("book.json", json, mode: "a")
  end
end
