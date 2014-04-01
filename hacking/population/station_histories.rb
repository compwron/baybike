class StationHistories
  require_relative 'station_history'
  require_relative 'bike_level'

  attr_reader :station_histories

  @@station_histories_by_id = []

  def initialize
    @station_histories = []
  end

  def add line
    station_id = station_id_from(line)
    bikes_available = bikes_available(line)
    date_time = date_time_from(line)


    if (@@station_histories_by_id[station_id].nil?) then
      @@station_histories_by_id[station_id] = StationHistory.new(station_id, [BikeLevel.new(date_time, bikes_available)])
    else
      if (@@station_histories_by_id[station_id].bike_levels.last.bike_count != bikes_available) then
        @@station_histories_by_id[station_id].add_bike_level(BikeLevel.new(date_time, bikes_available))
      end
    end
  end

  def date_time_from(line)
    date_chunk = line.split(',')[3].gsub('"', '').gsub("\n", '')
    DateTime.strptime(date_chunk, '%Y/%m/%d %H:%M:%S')
  end

  def bikes_available(line)
    line.split(',')[1].to_i
  end

  def station_id_from(line)
    line.split(',')[0].to_i
  end

end