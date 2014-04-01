# "bash refresh" (better on ui, but this is easy)
class Display # stolen from https://github.com/compwron/gameOfLife
  def initialize(station_histories)
    @station_histories = station_histories
  end

  def display
    @station_histories.each_with_index { |station_history, index|
      clear_screen
      puts "#{station_history}"
      sleep 0.5
    }
  end

  def clear_screen
    print "\e[2J\e[f"
  end
end