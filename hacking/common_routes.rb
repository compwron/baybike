require 'csv'

class Station < Struct.new(:name, :lat, :long)
end

class Route < Struct.new(:start, :end)
end

def parse_stations
	stations = []
	filename = ARGV[1]
	CSV.foreach(filename, :headers=>true, :header_converters => :symbol) do |row|
		stations << Station.new(row[:name], row[:lat], row[:long])
	end
	stations
end

def map_lat_long_to_routes
	filename = ARGV.first
	subscriber_type = ARGV[2] || "Subscriber"
	routes = []
	CSV.foreach(filename, :headers=>true) do |row|
		next unless row[9] == subscriber_type
		routes << Route.new(@stations.select{|station| station.name == row[3]}.first, @stations.select{|station| station.name == row[6]}.first)
	end
	routes
end

def map_count_to_routes
	all_routes = map_lat_long_to_routes
	routes_by_count = all_routes.inject(Hash.new(0))  { |hash, route| hash[route] += 1; hash}
	routes_by_count
end


def sort_by_count
	sorted_routes = map_count_to_routes.sort_by{|route| route[1]}.reverse!
	lines = ARGV[3].to_i
	sorted_routes = sorted_routes.take(lines)
	write_to_csv(sorted_routes) if ARGV[4].to_s == "save"
	sorted_routes
end

def write_to_csv(lines)
	CSV.open("results.csv", "w") do |csv|
		csv << ["count","start","start_lat","start_long","end","end_lat","end_long"]
		lines.each {|line| csv << [line[1], line[0][:start][:name], line[0][:start][:lat], line[0][:start][:long], line[0][:end][:name], line[0][:end][:lat], line[0][:end][:long]]}
	end
end

@stations = parse_stations
sort_by_count