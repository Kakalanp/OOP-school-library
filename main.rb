require './app'

def main
  puts '██ ██ █ █ ███ ███ █     █  █ ██▄ ███ ███ ███ █ █    ███ ███ ███'
  puts '█▄ █  █▄█ █ █ █ █ █     █  █ █▄█ █▄  █▄█ █▄  █▄█    █▄█ █▄█ █▄█'
  puts '▄█ ██ █ █ █▄█ █▄█ ██    ██ █ █▄█ █ █ █ █ █ █  █     █ █ █   █  '

  app = App.new
  app.menu
end

main
