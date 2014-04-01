class BikeLevel
  attr_accessor :date_time, :bike_count

  def initialize(date_time, bike_count)
    @date_time = date_time
    @bike_count = bike_count
  end

  def to_s
    #bike_count.size * "-\n"
    #" #{bike_count}"
    "[#{date_time} | #{bike_count}]"
  end
end
