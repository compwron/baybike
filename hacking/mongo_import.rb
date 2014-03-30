dbname = 'baybike'

# cleanup existing data
`mongo dbname --eval "db.dropDatabase()"`

# Dir.foreach("../data") do |file|
dir = "../201402-babs-open-data"
Dir.foreach(dir) do |file|
  next if file == '.' or file == '..' or file == ".DS_Store"
  collection_name = file.gsub('201402_', '').gsub('_data.csv', '')
  command = "mongoimport -d #{dbname} -c #{collection_name} --type csv --file #{dir}/#{file} --headerline"
  puts "running command: #{command}"
  `#{command}`
end