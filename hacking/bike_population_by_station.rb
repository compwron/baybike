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


class BikeLevel
	attr_accessor :date_time, :bike_count
	def initialize(date_time, bike_count)
		@date_time = date_time
		@bike_count = bike_count
	end
end

class StationHistory
	attr_accessor :station_id, :bike_levels
	def initialize(station_id, bike_levels)
		@station_id = station_id
		@bike_levels = bike_levels
	end

  def add_bike_level bike_level
    @bike_levels += bike_level
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

# "station_id","bikes_available","docks_available","time"
# "83","8","7","2014/02/28 22:20:02"

require 'date'

# station has timestamp-count map. only add new item to map when count changes? OR take daily timestamp data... every half hour?

# rebalancing = 'data/201402_rebalancing_data.csv'
rebalancing = 'datasets/rebalancing_sample.csv'

stations_status = {1 => [], 2 => [], 3=> []} # station id => [BikeLevel(timestamp, # of bikes), BikeLevel(), BikeLevel()...]

station_ids = [1, 2, 3] # TODO: get this dynamically from the real stations file

stations = File.open(rebalancing).each_with_index { |line, index|
  	unless index == 0
  		puts "processing line: #{line}"
  		station_id = line.split(',')[0].to_i
  		bikes_available = line.split(',')[1].to_i

      date_chunk = line.split(',')[3].gsub('"', '').gsub("\n", '')
      date_time = DateTime.strptime(date_chunk, '%Y/%m/%d %H:%M:%S')

      if(stations_status[station_id].nil?) then
        stations_status[station_id] = StationHistory.new(station_id, [BikeLevel.new(date_time, bikes_available)]) 
      end
  		if(bikes_available != stations_status[station_id]) then # assume that stations_status is pre-populated with empty list

  		end

  	end
}.drop(1).map{|date| 
	DateTime.strptime(date, '%m/%d/%Y')
}


