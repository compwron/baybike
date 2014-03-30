dbname = 'baybike'

# cleanup existing data
`mongo dbname --eval "db.dropDatabase()"`

# download and unzip zip file
`curl https://s3.amazonaws.com/trackerdata/201402_babs_open_data.zip`
`unzip 201402-babs-open-data.zip`
`mv 201402-babs-open-data data`

dir = "data"
# dir = "../201402-babs-open-data"
Dir.foreach(dir) do |file|
  next if file == '.' or file == '..' or file == ".DS_Store"
  collection_name = file.gsub('201402_', '').gsub('_data.csv', '')
  command = "mongoimport -d #{dbname} -c #{collection_name} --type csv --file #{dir}/#{file} --headerline"
  puts "running command: #{command}"
  `#{command}`
end