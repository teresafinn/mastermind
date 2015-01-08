require_relative 'validate_input'
require_relative 'validate_guess'
require_relative 'messages'

class Mastermind

  attr_reader :secret_array, :guess_count, :game_started

  def initialize
    @secret_array = create_secret
    @validate_input = ValidateInput.new
    @validate_guess = ValidateGuess.new(secret_array)
    @messages = Messages.new
    @game_started = false
    @guess_count = 0
    @start_time = nil
    @end_time = nil
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
    @guess_count = 0
    @validate_guess.overwrite_secret(create_secret)
    @start_time = Time.new
  end

  def execute(input)
    if game_started?
      game_report(input)
    else
      menu_report(input)
    end
  end

  def game_report(input)
    errors = @validate_input.validate_length(input)
    if errors.nil?
      play(input)
    else
      errors
    end
  end

  def menu_report(input)
    case
    when input == "i"
      @messages.instructions
    when input == "q"
      @messages.quit
    when input == "p"
      start_game
      @messages.play_begins
    else
      @messages.input_options
    end
  end

  def play(input)
    @guess_count += 1
    position = @validate_guess.correct_position(input.split(""))
    color = @validate_guess.correct_color(input.split(""))

    if position == 4
      game_winner(input)
    else
      @messages.try_again(input, color, position, @guess_count)
    end
  end

  def game_winner(input)
    @end_time = Time.new
    seconds = Time.at(@end_time-@start_time).utc.strftime("%S")
    minutes = Time.at(@end_time-@start_time).utc.strftime("%M")
    @game_started = false
    @messages.win(input, @guess_count, seconds, minutes)
  end

end