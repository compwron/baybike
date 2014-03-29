# require 'io'

trips = '201402_trip_data.csv'

bike_trips = {}
largest_id = 0
largest_count = 0

File.open(trips).map { |line|
    id = line.split(',')[8]
    # p id
    bike_trips[id].nil? ? bike_trips[id] = 1 : bike_trips[id] += 1
}

bike_trips.each { |id, count|
	if (count > largest_count) then 
		largest_count = count
		largest_id = id 
	end
}

p "largest id: #{largest_id} with count: #{bike_trips[largest_id]}"

