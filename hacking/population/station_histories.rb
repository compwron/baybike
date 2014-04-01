class StationHistories
  require_relative 'station_history'
  require_relative 'bike_level'

  attr_reader :station_histories

  def initialize
    @station_histories = []
  end

  def add line
    station_id = station_id_from(line)
    bikes_available = bikes_available(line)
    date_time = date_time_from(line)

    if (!contains_station(station_id)) then
      @station_histories << StationHistory.new(station_id, [BikeLevel.new(date_time, bikes_available)])
    end

    if (station_with(station_id).bike_levels.last.bike_count != bikes_available) then
      station_with(station_id).add_bike_level(BikeLevel.new(date_time, bikes_available))
    end
    @station_histories.compact!
  end

  def station_with(station_id)
    find_by_id(station_id).first
  end

  def find_by_id(station_id)
    @station_histories.select{|station_history|
      station_history.station_id == station_id
    }
  end

  def contains_station(station_id)
    !find_by_id(station_id).empty?
  end

  def date_time_from(line)
    date_chunk = line.split(',')[3].gsub('"', '').gsub("\n", '')
    DateTime.strptime(date_chunk, '%Y/%m/%d %H:%M:%S')
  end

  def bikes_available(line)
    line.split(',')[1].gsub('"', '').to_i
  end

  def station_id_from(line)
    line.split(',')[0].gsub('"', '').to_i
  end

end