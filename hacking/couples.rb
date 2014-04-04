require 'pry'
require 'date'

trips = '../datasets/201402_trip_data.csv'

class Trip
    attr_reader :start_time,:end_time,:start_station,:end_station, :bike, :zip
    def initialize(raw_data)
        @start_time = Trip.parse_silly_date_time(raw_data[2])
        @start_station = raw_data[4]
        @end_time = Trip.parse_silly_date_time(raw_data[5])
        @end_station = raw_data[7]
        @bike = raw_data[8]
        @zip = raw_data[10]
    end

    def self.parse_silly_date_time(str)
        DateTime.strptime(str, '%m/%d/%Y %H:%M')
    end

    def start_end_pair
        "#{start_station} #{end_station}"
    end

    def is_coupled_to(other)
        (abs_time_delta( start_time, other.start_time ) < 3) && 
            (abs_time_delta( end_time, other.end_time ) < 3)
    end

    def to_s
        "[#{start_station},#{end_station}] (#{bike}) #{start_time} => #{end_time}     #{zip}"
    end

    def on_day(date)
        start_time.to_date == DateTime.parse(date, '%m/%d/%Y')
    end

    private
    def abs_time_delta(a,b)
        (a.to_time.to_i - b.to_time.to_i).abs
    end
end
all_the_trips = File.open(trips).drop(1).map{ |line|
    Trip.new(line.split(","))
}

start_end_buckets = {}
all_the_trips.each do |trip|
    bucket_id = trip.start_end_pair
    start_end_buckets[bucket_id] ||= []
    start_end_buckets[bucket_id] << trip
end

romance = []
start_end_buckets.each do |bucket_id , trips|
    likely_couples = []
    trips.sort_by{ |trip| trip.start_time }.each_cons(2) do |pair|
        first,second = pair
        # find all trips which differ by less than 10 mins
        if first.is_coupled_to(second)
            likely_couples << pair
        end
    end

    romance += likely_couples
end

romance.each do |trip_pair|
    puts trip_pair
    puts
end


binding.pry
