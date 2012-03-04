require "test/unit"

=begin

saas-class.org
HW 1: Ruby calisthenics

by Nathan Dotz
sleeptron@gmail.com

=end

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
