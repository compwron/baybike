class StationHistory
  attr_accessor :station_id, :bike_levels

  def initialize(station_id, bike_levels)
    @station_id = station_id
    @bike_levels = bike_levels
  end

  def add_bike_level bike_level
    @bike_levels += [bike_level]
  end

  def to_s
    "[#{station_id} | #{bike_levels}]"
  end

  def == other
    @station_id == other.station_id &&
        @bike_levels == other.bike_levels
  end
end