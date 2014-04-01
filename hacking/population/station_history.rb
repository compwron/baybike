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

  end
end