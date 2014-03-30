# grab data
# unzip data
# create mongo
# load mongo

curl https://s3.amazonaws.com/trackerdata/201402_babs_open_data.zip
unzip 201402_babs_open_data.zip data
cd data

ruby mongo_import.rb
