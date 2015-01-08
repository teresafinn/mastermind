require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test

  def setup
    @mm = Mastermind.new
  end

  def test_it_exists
    assert MastermindTest
  end

  def test_it_creates_a_secret_array
    assert_equal 4, @mm.create_secret.count
  end

  def test_each_secret_is_unique
    secret_1 = @mm.create_secret
    secret_2 = @mm.create_secret
    refute_equal secret_1.object_id, secret_2.object_id
  end

  def test_game_keeps_count
    input = "rrrr"
    @mm.play(input)
    @mm.play(input)
    @mm.play(input)
    assert_equal 3, @mm.guess_count
  end

  def test_game_started_resets_after_win
    @mm.start_game
    input = "rrrr"
    @mm.game_winner(input)
    assert_equal false, @mm.game_started
  end

  def test_game_count_resets_on_new_game
    @mm.start_game
    input = "rrrr"
    @mm.play(input)
    @mm.play(input)
    @mm.play(input)
    @mm.game_winner(input)
    @mm.start_game
    assert_equal 0, @mm.guess_count
  end
end