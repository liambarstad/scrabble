gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test

  def test_it_communicates_with_scrabble
    game = GameReader.new
    value = game.point_values["X"]
    assert 8, value
  end

  def test_it_can_score_nil
    game = GameReader.new
    assert_equal 0, game.score(nil)
  end

  def test_it_can_score_empty_string
    game = GameReader.new
    assert_equal 0, game.score("")
  end

  def test_it_can_score_a_string
    game = GameReader.new
    assert_equal 8, game.score("hello")
  end

  def test_it_can_score_a_string_without_total_multiplier
    game = GameReader.new
    assert_equal 9, game.score_with_multipliers("hello", [1, 2, 1, 1, 1,])
  end

  def test_it_can_score_a_string_with_total_multiplier
    game = GameReader.new
    assert_equal 18, game.score_with_multipliers("hello", [1, 2, 1, 1, 1], 2)
  end

  def test_it_will_apply_bonus_points_without_multiplier
    game = GameReader.new
    assert_equal 23, game.score("sparkle")
  end

  def test_it_will_apply_bonus_points_with_multiplier
    game = GameReader.new
    assert_equal 58, game.score_with_multipliers("sparkle", [1, 2, 1, 3, 1, 2, 1], 2)
  end

end
