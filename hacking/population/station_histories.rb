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

    if (@station_histories[station_id].nil?) then
      @station_histories[station_id] = StationHistory.new(station_id, [BikeLevel.new(date_time, bikes_available)])
    end
    if (@station_histories[station_id].bike_levels.last.bike_count != bikes_available) then
      puts "zomg"
      @station_histories[station_id].add_bike_level(BikeLevel.new(date_time, bikes_available))
    end
    @station_histories.compact!
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