require 'date'

trips = '201402_trip_data.csv'

days = {}

File.open(trips).each_with_index { |line, index|
	unless index == 0
    	plain_date = line.split(',')[2].split(' ')[0]
    	dow = DateTime.strptime(plain_date, '%m/%d/%Y').strftime('%A')

    	days[dow].nil? ? days[dow] = 1 : days[dow] += 1
	end
}

max_usage_dow = days.max_by{ |pair| 
	pair.last
}

puts "Most used day was: #{max_usage_dow.first} with usage of: #{max_usage_dow.last}"

# p days.group_by{ |day| day}