class ValidateGuess

  attr_reader :secret_array

  def initialize(secret_array)
    @secret_array = secret_array
  end

  def overwrite_secret(input)
    @secret_array = input
  end

  def correct_position(input)
    combined_array = secret_array.zip(input)

    matches = combined_array.map { |pair| pair[0] == pair[1] }

    matches.count(true)
  end  

  def remove_position_matches(input)
    combined_array = secret_array.zip(input)
    matches_removed = combined_array.reject { |pair| pair[0] == pair[1]}
    matches_removed.transpose
  end

  def correct_color(input)
    secret_array, input = remove_position_matches(input)
    secret_array ||= []
    input ||= []
    secret_array.each do |color|
      if input.include?(color)
        position = input.index(color)
        input.delete_at(position)
      end
    end

    secret_array.count - input.count
  end

end