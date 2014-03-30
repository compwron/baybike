require 'csv'
def collect_routes
	filename = ARGV.first
	routes = []
	CSV.foreach(filename, :headers=>true) do |row|
		next unless row[9] == "Subscriber"
		routes << {:start => row[3], :end => row[6]}
	end
	routes
end

def sort_by_count
	routes_count = collect_routes.inject(Hash.new(0)) {|h, v| h[v] += 1; h}
	sorted_routes = routes_count.sort_by{|route| route[1]}.reverse!
	lines = ARGV[1].to_i
	sorted_routes = sorted_routes.take(lines)
	sorted_routes.each do |route|
		puts "Count: \t #{route[1]} \t Start: #{route[0][:start]} \t End: #{route[0][:end]}"
	end
end

sort_by_count