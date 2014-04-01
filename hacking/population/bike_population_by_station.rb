require_relative 'station_histories'

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

station_histories = StationHistories.new()

stations = File.open(rebalancing).each_with_index { |line, index|
  unless index == 0
    station_histories.add(line)
  end
}

p stations_status

Display.new(stations_status).display


