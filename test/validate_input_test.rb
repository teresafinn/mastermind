require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validate_input'

class ValidateInputTest < Minitest::Test
  
  def setup
    @validate_input = ValidateInput.new
  end

  def test_input_too_long
    #method to validate if input is too long
    input = "abcde"
    assert_equal "Your guess is too long! Please guess again.", @validate_input.validate_length(input)
  end

  def test_input_too_short
    input = "abc"
    assert_equal "Your guess is too short! Please guess again.", @validate_input.validate_length(input)
  end

  def test_input_consists_of_rgby_elements
    input = "abcd"
    assert_equal "Valid input consists of (r)ed, (g)reen, (b)lue, and (y)ellow. Please guess again using these values.", @validate_input.valid_characters(input)

    input = "rrrr"
    assert_equal nil, @validate_input.valid_characters(input)

    input = "bryg"
    assert_equal nil, @validate_input.valid_characters(input)
  end

  def test_input_converted_to_array
    input = "abcd"
    assert_equal ["a", "b", "c", "d"], @validate_input.validate_array(input)
  end

end