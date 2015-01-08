require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class MessagesTest < Minitest::Test
  
  def setup
    @messages = Messages.new
  end

  def test_it_exists
    assert MessagesTest
  end

  def test_welcome_message_displays
    assert @messages.welcome.include?("Would you like to (p)lay, read the (i)nstructions, or (q)uit?")
  end

  def test_play_begins
    assert @messages.play_begins.include?("I have generated a beginner sequence with four elements made up of:")
  end

  def test_instructions
    assert @messages.instructions.include?("The computer will generate a secret code using a combination of four different colored pegs")
  end

  def test_quit
    assert @messages.quit.include?("Thank you for playing Mastermind")
  end

end
