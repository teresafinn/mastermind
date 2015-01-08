require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'
require_relative '../lib/validate_guess'

class ValidateGuessTest < Minitest::Test
  
  def setup
    mm = Mastermind.new
    @vg = ValidateGuess.new(mm.secret_array)
  end

  def test_secret_array_is_overwritable
    @vg.overwrite_secret(["g", "g", "b", "y"])
    assert_equal ["g", "g", "b", "y"], @vg.secret_array
    
    @vg.overwrite_secret (["g", "g", "b", "b"])
    assert_equal ["g", "g", "b", "b"], @vg.secret_array
  end

  def test_has_one_correct_position
    @vg.overwrite_secret(["g", "g", "b", "y"])
    input = ["g", "y", "y", "b"]
    assert_equal 1, @vg.correct_position(input)
  end

  def test_has_two_correct_positions
    @vg.overwrite_secret(["g", "g", "b", "b"])
    input = ["g", "y", "y", "b"]
    assert_equal 2, @vg.correct_position(input)
  end

  def test_has_four_correct_positions
    @vg.overwrite_secret(["r", "g", "b", "y"])
    input = ["r", "g", "b", "y"]
    assert_equal 4, @vg.correct_position(input)
  end

  def test_has_two_correct_colors
    @vg.overwrite_secret(["g", "g", "y", "y"])
    input = ["y", "y", "r", "r"]
    assert_equal 2, @vg.correct_color(input)
  end

  def test_has_zero_correct_colors
    @vg.overwrite_secret(["g", "g", "y", "y"])
    input = ["r", "b", "r", "b"]
    assert_equal 0, @vg.correct_color(input)
  end

  def test_has_four_correct_colors
    @vg.overwrite_secret(["g", "g", "y", "y"])
    input = ["y", "y", "g", "g"]
    assert_equal 4, @vg.correct_color(input)
  end

end