# "bash refresh" (better on ui, but this is easy)
class Display # stolen from https://github.com/compwron/gameOfLife
  def initialize(game)
    @game = game
  end

  def display
    @game.grids.each_with_index { |grid, index|
      clear_screen
      puts "#{grid}\n\nIteration:#{index}"
      sleep 0.5
    }
  end

  def clear_screen
    print "\e[2J\e[f"
  end
end
# of bikes vs stations:

# 5                        -
# 4                        -
# 3                        -
# 2     -                  -
# 1     -        -         -
# 0     -        -         -
#   station1  station2  station3
