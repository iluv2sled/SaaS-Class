class WrongNumberOfPlayersError < StandardError ; end

class NoSuchStrategyError < StandardError ; end


def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  p1 = game[0][1].downcase
  p2 = game[1][1].downcase

  plays = p1 + p2
  raise NoSuchStrategyError if p1 == "1" || p2 == "1"
  raise NoSuchStrategyError if plays.gsub(/[rps]/,"1") != "11"

  winner = "none"
  #r beats s
  #s beats p
  #p beats r
  if p2 == "s" && p1 == "p"
    winner = game[1]
  elsif p2 == "p" && p1 == "r"
    winner = game[1]
  elsif p2 == "r" && p1 == "s"
    winner = game[1]
  else
    winner = game[0]
    end
  puts "game is - "
  puts game
  puts p1
  puts p2
  puts "winner 2 is - "
  puts winner
  return winner

end

def rps_tournament_winner(games, depth = 1)
  puts "depth = " + depth.to_s
  if games[0][0].class == String
    puts "end game"
    puts games
    winner = rps_game_winner(games)
    puts "winner is "
    puts winner
    return winner
  else
    puts "carry on"
    puts games
    winner = rps_game_winner([rps_tournament_winner(games[0],depth+1), rps_tournament_winner(games[1],depth+1)])
    puts "winner is "
    puts winner
    return winner
  end
end

game = [ ["Armado", "r" ], [ "Dave", "r" ] ]
#puts rps_game_winner(game)

games = [[
[ ["Armando", "P"], ["Dave", "S"] ],
  [ ["Richard", "R"], ["Michael", "S"] ],
  ],
  [
  [ ["Allen", "S"], ["Omer", "P"] ],
  [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]

winner = rps_tournament_winner(games)
puts "winner is: "
puts winner

