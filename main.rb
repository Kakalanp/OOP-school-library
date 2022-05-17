require './app'

# rubocop:disable Metrics/CyclomaticComplexity
def options(option)
  case option
  when 1
    @app.list_books
  when 2
    @app.list_people
  when 3
    @app.create_person
  when 4
    @app.create_book
  when 5
    @app.create_rental
  when 6
    @app.list_rental
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

def main
  puts '██ ██ █ █ ███ ███ █     █  █ ██▄ ███ ███ ███ █ █    ███ ███ ███'
  puts '█▄ █  █▄█ █ █ █ █ █     █  █ █▄█ █▄  █▄█ █▄  █▄█    █▄█ █▄█ █▄█'
  puts '▄█ ██ █ █ █▄█ █▄█ ██    ██ █ █▄█ █ █ █ █ █ █  █     █ █ █   █  '

  @app = App.new
  menu
end

main
