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

    read_book_json
    read_people_json
    read_rentals_json
  end

  def list_books
    p @books
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
    p @rentals
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
    booklist = JSON.parse(File.read('book.json')) if File.exist?('book.json')
    booklist.each do |book|
      normal_book = JSON.parse(book)
      @books << Book.new(normal_book[0], normal_book[1])
    end
    puts @books
  end

  def read_people_json
    peoplelist = JSON.parse(File.read('people.json')) if File.exist?('people.json')
    peoplelist.each do |person|
      normal_person = JSON.parse(person)
      @people << if normal_person[0] == 1
                   Student.new(normal_person[1], normal_person[2], normal_person[3], normal_person[4])
                 else
                   Teacher.new(normal_person[1], normal_person[2], normal_person[3])
                 end
    end
    puts @people
  end

  def read_rentals_json
    rentallist = JSON.parse(File.read('rental.json')) if File.exist?('rental.json')
    rentallist.each do |rental|
      normal_rental = JSON.parse(rental)
      @rentals << @people[normal_rental[2]].add_rental(normal_rental[0], @books[normal_rental[1]])
    end
    puts @rentals
  end

  def save_book
    saved_books = []

    @books.each do |book|
      saved_books.push(book.add_json_book)
    end

    File.write('book.json', saved_books)
  end

  def save_person
    saved_person = []

    @people.each do |person|
      if person.instance_of?(Teacher)
        saved_person.push(person.add_json_teacher)
      else
        saved_person.push(person.add_json_student)
      end
    end

    File.write('people.json', saved_person)
  end

  def save_rental
    saved_rental = []

    @rentals.each_with_index do |rental, index|
      rental_book = rental[index].book.title
      rental_person = rental[index].person.id

      @books.each_with_index do |book, i|
        rental_book = i if book.title == rental_book
      end

      @people.each_with_index do |person, i|
        rental_person = i if person.id == rental_person
      end

      saved_rental.push(rental[index].add_json_rental(rental_book, rental_person))
    end

    File.write('rental.json', saved_rental)
  end

  def exit
    save_book
    save_person
    save_rental

    abort('Thanks for using the app, see you later!')
  end
end
