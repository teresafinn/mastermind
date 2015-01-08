require './lib/validate_input'
require './lib/validate_guess'
require './lib/messages'

class Mastermind
  
  attr_reader :secret_array

  def initialize
    @secret_array = create_secret
    @validate_input = ValidateInput.new
    @validate_guess = ValidateGuess.new(secret_array)
    @messages = Messages.new
    @game_started = false
    @start_time = nil
    @end_time = nil
    @guess_count = 0
  end

  def create_secret
    secret = []
    valid_colors = ["r", "g", "b", "y"]
    
    4.times do 
      secret << valid_colors.sample
    end

    secret
  end

  def game_started?
    @game_started
  end

  def start_game
    @game_started = true
    @start_time = Time.new
  end
  
  def play(input)
    @guess_count += 1
    position = @validate_guess.correct_position(input.split(""))
    color = @validate_guess.correct_color(input.split(""))

    if position == 4
      game_winner(input)
    else
      puts @messages.try_again(input, color, position, @guess_count)
    end
  end

  def game_winner(input)
      @end_time = Time.new
      seconds = Time.at(@end_time-@start_time).utc.strftime("%S")
      minutes = Time.at(@end_time-@start_time).utc.strftime("%M")
      puts @messages.win(input, @guess_count, seconds, minutes)
      @game_started = false
      @guess_count = 0
  end


  def execute(input)
    if game_started?
      errors = @validate_input.validate_length(input)
      if errors.nil?
        play(input)
      else
        puts errors
      end
    else
      menu_report(input)
    end
  end

  def menu_report(input)
    case
    when input == "i"
      puts @messages.instructions
    when input == "q"
      puts @messages.quit
    when input == "p"
      puts @messages.play_begins
      start_game
    else
      puts @messages.input_options
    end
  end

end
