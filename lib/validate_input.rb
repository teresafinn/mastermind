require_relative 'messages'

class ValidateInput

  def initialize
    @messages = Messages.new
  end

  def validate_length(input)
    if input == "q"
      @messages.quit
    elsif input.length > 4
      @messages.too_long
    elsif input.length < 4
      @messages.too_short
    else 
      valid_characters(input)
    end
  end

  def valid_characters(input)
    input_array = validate_array(input)
    valid_array = ["r", "g", "b", "y"]

    input_array.map! do |element|
      valid_array.include?(element)
    end   
   
    if input_array.include?(false)
      @messages.invalid_input
    else
      nil
    end
  end

  def validate_array(input)
    input.split("")
  end

end