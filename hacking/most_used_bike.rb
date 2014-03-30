class String
  def is_integer?
    self.to_i.to_s == self
  end
end

# trips = '201402_trip_data.csv'
trips = 'data/201402_trip_data.csv'

ids =  File.open(trips).map { |line, index|
  line.split(',')[8] unless index == 0
}.reject { |id|
  !id.is_integer?
}.map{|id| id.to_i}

unique_ids = ids.uniq.sort

unique_map = unique_ids.map {|id| {id => 0}}.inject{|a, b| a .merge(b)}

ids.each {|id| unique_map[id] += 1}

max = unique_map.max_by {|id_count| id_count.last}
min = unique_map.min_by {|id_count| id_count.last}

puts "bike id with largest number of usages: #{max.first} with #{max.last} usages"
puts "bike id with smallest number of usages: #{min.first} with #{min.last} usages"

least_used = unique_map.sort_by{|id_count| id_count.last}.first(10)

printable_least = least_used.map{|id_count| "bike id: #{id_count.first} - # of usages: #{id_count.last}"}.join("\n")

puts "\nleast-used bikes:"
puts printable_least
