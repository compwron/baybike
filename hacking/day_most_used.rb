require 'date'

# trips = '201402_trip_data.csv'
trips = 'data/201402_trip_data.csv'

days = {}

dates = File.open(trips).map { |line|
  	plain_date = line.split(',')[2].split(' ')[0]
}.drop(1).map{|date| 
	DateTime.strptime(date, '%m/%d/%Y')
}

unique_dates = dates.uniq.sort

count_per_day = unique_dates.map{|unique_date|
	[unique_date, dates.select{|date| date == unique_date}.count] # this takes too long
}

most = count_per_day.max_by{|per_day| per_day.last}.last
least = count_per_day.min_by{|per_day| per_day.last}.last

average_unit = (most - least) / 50

puts "viewing bikes rented per day - average unit"

puts count_per_day.map{ |per_day| 
	pretty_date = per_day.first.strftime("%m/%d/%Y %a")
	"#{pretty_date} #{'|' * (per_day.last / average_unit)}"
}
