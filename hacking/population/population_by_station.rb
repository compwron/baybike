require_relative 'station_histories'
require_relative 'display'

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

# rebalancing = '../../data/201402_rebalancing_data.csv'
#rebalancing = '../../datasets/rebalancing_sample.csv'
# perl -ne 'print ((0 == $. % 300) ? $_ : "")' ../../data/201402_rebalancing_data.csv > sampler.csv
rebalancing = 'sampler.csv'

def date_time_from(line)
  date_chunk = line.split(',')[3].gsub('"', '').gsub("\n", '')
  DateTime.strptime(date_chunk, '%Y/%m/%d %H:%M:%S')
end

def clear_screen
  sleep 0.5
  print "\e[2J\e[f"
end

def bikes_available(line)
  line.split(',')[1].gsub('"', '').to_i
end

def station_id_from(line)
  line.split(',')[0].gsub('"', '').to_i
end

station_histories = StationHistories.new()
#at timestamp x, update existing map with data
max_bikes_at_station = 12
station_count = 87
display = Display.new(max_bikes_at_station, station_count)

# need to go by timestamp, not order in db. use mongo? or sort file?

stations = File.open(rebalancing).each_with_index { |line, index|
  unless index == 0
    current_timestamp = date_time_from(line)
    station_histories.add(line)

    display.apply(bikes_available(line), station_id_from(line))

    clear_screen
    puts display
  end


}




