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

end
