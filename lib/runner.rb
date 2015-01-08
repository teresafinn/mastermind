require './lib/mastermind'
require './lib/messages'

@messages = Messages.new

puts @messages.welcome

input = ""
mastermind = Mastermind.new

while input != "q"
  print "> "
  input = gets.chomp
  mastermind.execute(input)
end
