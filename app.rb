['./book_class', './classroom_class', './person_class', './rental_class', './student_class',
 './teacher_class', 'json'].each do |file|
  require file
end


class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books
    if @books.empty?
      puts "\nThere are not available books, try adding one => 4"

    else
      puts "\nAll books in the library:\n"
      @books.each_with_index { |book, index| puts "(#{index + 1}): #{book.title}, By: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts "\nThere are not available people, try adding one => 3"

    else
      puts "\nPeople in the library:\n"
      @people.each_with_index do |person, index|
        puts "(#{index + 1}): Name: #{person.name}, ID: #{person.id}, Age: #{person.age} Ocupation: #{person.class}"
      end
    end
  end

  def create_student(age, classroom, parent_permission, name)
    @people << Student.new(age, classroom, parent_permission, name)
    puts "\n\nStudent Created succesfully!"
  end

  def create_teacher(age, specialization, name)
    @people << Teacher.new(age, specialization, name)
    puts "\n\nTeacher Created succesfully!"
  end

  def get_person_details(ocupation)
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    case ocupation
    when 1
      puts 'Classroom: '
      classroom = gets.chomp
      puts 'Has parent permission [Y/N]: '
      parent_permission = gets.chomp.downcase
      create_student(age, classroom, parent_permission, name)
    when 2
      puts 'Specialization: '
      specialization = gets.chomp
      create_teacher(age, specialization, name)
    end
  end

  def create_person
    puts "\nWhat ocupation does this person has?"
    puts '(1) Student'
    puts '(2) Teacher'
    ocupation = gets.chomp.to_i
    if ocupation.between?(1, 2)
      get_person_details(ocupation)
    else
      puts 'Invalid ocupation, try again => 3'
    end
  end

  def book_details
    puts "\nProvide book information."
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    [title, author]
  end

  def create_book
    title, author = book_details

    @books << Book.new(title, author)

    puts "\n\nBook succesfully created!"
  end

  def rental_details
    puts "\nSelect a book from the following list"
    list_books
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list"
    list_people
    person_index = gets.chomp.to_i

    print 'Date (yyyy mm dd):'
    date = gets.chomp

    [book_index, person_index, date]
  end

  def create_rental
    book_index, person_index, date = rental_details
    @rentals << @people[person_index - 1].add_rental(date, @books[book_index - 1])
    puts "\n\nRental successfully added!"
  end

  def list_rental
    if @rentals.empty?
      puts 'No rentals yet, try adding one => 5'

    else
      puts "\nAll rentals added in the library:\n"
      @people.each do |person|
        puts "Ocupation: #{person.class} Name: #{person.name}, ID: #{person.id} "
      end
      puts "\nSelect the person ID:"
      person_id = gets.chomp.to_i
      puts "\nRentals from person #{person_id}:\n"
      @rentals.each_with_index do |rental, index|
        if rental[index].person.id == person_id
          puts "Date: #{rental[index].date}, Book: #{rental[index].book.title} by #{rental[index].book.author}"
        end
      end
    end
  end


  def read_book_json
    # ruby = JSON.parse('book.json')
    File.foreach("book.json") { |line| 
      return JSON.parse(line)
    }
  end

  def exit
    @books.each do |book|
        book.add_json_book
    end
    abort('Thanks for using the app, see you later!')
  end
end
