['./book_class', './classroom_class', './person_class', './rental_class', './student_class',
 './teacher_class'].each do |file|
  require file
end

Class App
attr_accessor :books, :people, :rentals

def initialize
  @books = []
  @classroom = []
  @rentals = []
  @people = []
end

# rubocop:disable Metrics/CyclomaticComplexity
def options(option)
  case option
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rental
  when 7
    puts 'Thanks for using the app, see you later!'
  else
    puts 'Invalid option, try again.'
    menu
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def menu
  ["\n\nPlease choose an option by enterin a number:",
   '1.- List all books',
   '2.- List all people',
   '3.- Create a person',
   '4.- Create a book',
   '5.- Create a rental',
   '6.- List all rentals for a given person id',
   '7.- Exit'].each do |option|
    puts option
  end
  print '> '
  option = gets.chomp.to_i
  options(option)
end

def list_books
  if @books.empty?
    puts "\nThere are not available books, try adding one => 4"
    menu
  else
    @books.each_with_index { |book, index| puts "(#{index + 1}): #{book.title}, By: #{book.author}" }
  end
  menu
end

def list_people
  if @people.empty?
    puts "\nThere are not available people, try adding one => 3"
    menu
  else
    organized_people = @people.sort_by { person.class }
    organized_people.each_with_index do |person, index|
      puts "(#{index + 1}): Name: #{person.name}, ID: #{person.id}, Age: #{person.age} Ocupation: #{person.class}"
    end
  end
  menu
end

# rubocop:disable Metrics/MethodLength
def create_person
  puts 'What ocupation does this person has?'
  puts '(1) Student'
  puts '(2) Teacher'
  ocupation = gets.chomp.to_i
  if ocupation.between?(1, 2)
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp
    case ocupation
    when 1
      puts 'Classroom: '
      classroom = gets.chomp
      puts 'Has parent permission [Y/N]: '
      parent_permission = gets.chomp
      @persons << Student.new(age, classroom, name, parent_permission)
    when 2
      puts 'Specialization: '
      specialization = gets.chomp
      @persons << Teacher.new(age, specialization, name)
    end
    puts 'Person Created succesfully'

  else
    puts 'Invalid ocupation, try again => 3'
    menu
  end
end
# rubocop:enable Metrics/MethodLength

def create_book
  puts 'Provide book information.'
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  @books << Book.new(title, author)
  puts 'Book succesfully created'
end

def create_rental
  puts 'Select a book from the following list'
  @books.each_with_index do |book, index|
    puts "(#{index + 1}): #{book.title}, By: #{book.author}"
  end
  book_index = gets.chomp.to_i
  puts 'Select a person from the following list'
  @people.each_with_index do |person, index|
    puts "(#{index + 1}): Name: #{person.name}, ID: #{person.id}, Age: #{person.age} Ocupation: #{person.class}"
  end
  person_index = gets.chomp.to_i
  print 'Date (yyyy - mm - dd):'
  date = gets.chomp
  @rentals << @people[person_index].add_rental(date, @books[book_index])
  puts 'Rental successfully added'
  menu
end

def list_rental
  if @rentals.empty?
    puts 'No rentals yet, try adding one => 5'
    menu
  else
    @people.each do |person|
      puts "Ocupation: #{person.class} Name: #{person.name}, ID: #{person.id} "
    end
    print 'Select the person ID: '
    person_id = gets.chomp.to_i
    puts "Rentals from person #{person_id}"
    @rentals.each_with_index do |rental, index|
      if rental[index].person.id == person_id
        puts "Date: #{rental[index].date}, Book: #{rental[index].book.title} by #{rental[index].book.author}"
      end
    end
  end
  menu
end
