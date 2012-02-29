require "test/unit"

=begin

saas-class.org
HW 1: Ruby calisthenics

by Nathan Dotz
sleeptron@gmail.com

=end

###
# Part 1: fun with strings
###

def palindrome? ( something )
  raise unless something.is_a?(String)
  test_string = something.downcase.gsub(/\W/, '')
  return test_string == test_string.reverse
end

def count_words ( something )
  test_list = something.downcase.gsub(/\W+/,' ').split(/\b/)
  success_hash = {}
  test_list.uniq.each { |x| success_hash[x] = test_list.count(x)}
  success_hash.delete(" ")
  success_hash
end

class TestStrings < Test::Unit::TestCase

  def test_palindrome
    assert_equal(true, palindrome?("A man, a plan, a canal -- Panama"))
    assert_equal(true, palindrome?("Madam, I'm Adam!"))
    assert_equal(false, palindrome?("Abracadabra"))
  end

  def test_count_words
    panama_answer = {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
    doo_bee_answer = {'doo' => 3, 'bee' => 2}
    assert_equal(panama_answer, count_words("A man, a plan, a canal -- Panama"))
    assert_equal(doo_bee_answer, count_words("Doo bee doo bee doo"))
  end
end

###
# Part 2: Rock-Paper-Scissors
###

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each{ |player|
    raise NoSuchStrategyError unless ['R','P','S'].include? player.last }
  a = game.first
  b = game.last
  if a.last == 'R'
    return b.last == 'P' ? b : a
  elsif a.last == 'P'
    return b.last == 'S' ? b : a
  else
    return b.last == 'R' ? b : a
  end

end

def rps_tournament_winner ( tourney )
  if tourney.first.first.is_a? String
    return rps_game_winner tourney
  else
    rps_game_winner [rps_tournament_winner(tourney.first), rps_tournament_winner(tourney.last)]
  end
end


class TestRPS < Test::Unit::TestCase

  def test_rps_game_winner
    assert_raise(WrongNumberOfPlayersError) { rps_game_winner([1,2,3]) }
    assert_raise(WrongNumberOfPlayersError) { rps_game_winner([1]) }
    assert_raise(NoSuchStrategyError) {rps_game_winner [['bob', 'Z'], ['jane', 'B']]}

    assert_equal(["Dave", "S"], rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ]))
    assert_equal(["Armando", "P"], rps_game_winner([ [ "Armando", "P" ], [ "Dave", "P" ] ]))

  end

  def test_rps_tournament_winner
    tournament = [
                  [
                   [ ["Armando", "P"], ["Dave", "S"] ],
                   [ ["Richard", "R"], ["Michael", "S"] ],
                  ],
                  [
                   [ ["Allen", "S"], ["Omer", "P"] ],
                   [ ["David E.", "R"], ["Richard X.", "P"] ]
                  ]
                 ]

    assert_equal(["Richard", "R"], rps_tournament_winner(tournament))
  end

end
