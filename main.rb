require './app'

def options(option)
  option_list = %w[list_books
                   list_people
                   create_person
                   create_book
                   create_rental
                   list_rental
                   exit]
  if option.between?(1, 7)
    @app.send(option_list[option - 1])
  else
    puts 'Invalid option, try again.'
  end
  menu
end

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

def main
  puts '██ ██ █ █ ███ ███ █     █  █ ██▄ ███ ███ ███ █ █    ███ ███ ███'
  puts '█▄ █  █▄█ █ █ █ █ █     █  █ █▄█ █▄  █▄█ █▄  █▄█    █▄█ █▄█ █▄█'
  puts '▄█ ██ █ █ █▄█ █▄█ ██    ██ █ █▄█ █ █ █ █ █ █  █     █ █ █   █  '

  @app = App.new
  menu
end

main
