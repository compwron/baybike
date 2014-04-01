# "bash refresh" (better on ui, but this is easy)
class Display # stolen from https://github.com/compwron/gameOfLife
  attr_reader :display

  def initialize(max_bikes_at_station, station_count)
    @station_count = station_count
    empty = '-'

    @display = []
    stations = (0..station_count - 1).to_a
    bikes = (0..max_bikes_at_station - 1).to_a
    stations.each { |station|
      bikes.each { |bike|
        if @display[bike].nil? then
          @display[bike] = []
        end
        @display[bike][station] = empty
      }
    }
  end

  def apply(bikes_available, station)
    bikes = (0..bikes_available - 1).to_a
    bikes.each { |bike|
      @display[bike][station - 1] = 'o'
    }
  end

  def to_s
    pretty = ''
    @display.each_with_index { |row, index|
      pretty += "\n#{row.join("")} #{(index + 1).to_s.reverse}"
    }
    #pretty.reverse + "  " + (1..@station_count).to_a.join(" ")
    pretty.reverse
  end
end