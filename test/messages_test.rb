require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class MessagesTest < Minitest::Test
  
  def setup
    #define a new instance of the class that you can run tests against. 
    @messages = Messages.new
  end

  def test_it_exists
    assert MessagesTest
  end

  def test_welcome_message_displays
    #the command ruby mastermind.rb should pull up a welcome message
    #call the method .welcome on your mm object? on your messages object?
    assert_equal "Welcome to MASTERMIND! \n Would you like to (p)lay, read the (i)nstructions, or (q)uit?", @messages.welcome
  end

  def test_p_begins_play
    #when input is p the user should see "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. \n What's your guess?"
  end

  def test_i_lists_instructions
    #call the .instructions method in messages on your object
  end

  def test_q_quits_game
    #call the .quit method in messages on your object
  end

end
