require '../lib/scrabble.rb'
class GameReader
  include Scrabble::Points

  def score(str)
    score = check_if_nil(str)
    if score != 0
      read_score(str)
    else
      score = check_if_bonus(str, score)
      score
    end
  end

  def score_with_multipliers(str, arr, multiplier=1)
    score = check_if_nil(str)
    if score != 0
      score = read_score_with_multipliers(str, arr)
    end
    score = check_if_bonus(str, score)
    score *= multiplier
  end

  def check_if_nil(str)
    if str.nil?
      0
    else
      str
    end
  end

  def read_score(str)
    score = 0
    str.each_char do |char|
      score += point_values[char.upcase]
    end
    score
  end

  def read_score_with_multipliers(str, arr)
    score = 0
    for i in 0..(str.length - 1)
      score += (point_values[str[i].upcase] * arr[i])
    end
    score
  end

  def check_if_bonus(str, score)
    if str.length > 6
      score += 10
    else
      score
    end
  end
end
