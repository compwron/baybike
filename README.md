# Bay Area Bike Share Open Data Challenge

* Poking around with the data set from https://bayareabikeshare.com/datachallenge
* Download it here https://s3.amazonaws.com/trackerdata/201402_babs_open_data.zip
* Extract the datasets to the datasets directory

# Mongo, mon!
* Get mongo
```
brew install mongo
```
* Import data sets to collections

```
cd hacking ; ruby mongo_import.rb
# or:
mongoimport -d baybike -c trips --type csv --file 201402_trip_data.csv --headerline
mongoimport -d baybike -c station --type csv --file 201402_station_data.csv --headerline
mongoimport -d baybike -c weather --type csv --file 201402_weather_data.csv --headerline
mongoimport -d baybike -c rebalancing --type csv --file 201402_rebalancing_data.csv --headerline
```

* Open mongo

```
mongo
```

* View Data

```
use baybike
db.trips.find().pretty()
```
# Questions we have about the data

## Currently in progress:
* day of week that bikes are most used?
* most frequent subscriber routes
```
1253 Townsend at 7th,San Francisco Caltrain (Townsend at 4th)
1044 San Francisco Caltrain 2 (330 Townsend),Townsend at 7th
 820 Market at Sansome,2nd at South Park
 763 2nd at South Park,Market at Sansome
 680 San Francisco Caltrain (Townsend at 4th),Harry Bridges Plaza (Ferry Building)
 678 San Francisco Caltrain (Townsend at 4th),Embarcadero at Folsom
 673 Embarcadero at Sansome,Steuart at Market
 621 2nd at Townsend,Harry Bridges Plaza (Ferry Building)
 620 San Francisco Caltrain (Townsend at 4th),Temporary Transbay Terminal (Howard at Beale)
 609 Steuart at Market,2nd at Townsend
```

## Finished:
* bike id with most trips: id: 510, count: 482
* Most used day was: Thursday with usage of: 25265

## To Do:
* days with fewest rentals (what is the number of rentals on the day with the smallest rentals?)
* most used, least used bike
* day with fewest trips
* least often used bike id
* average lifetime of bikes
* spread of most-used and least-used bikes
* longest checked out bike
* longest trip
* Hour with most bikes checked out per day
* find allday rentals
* Find the usage of bikes on the day with worst weather
* bike station affinity rating per bike
* bike that's moved the least
* hottest day, coldest day, see how many rentals are on that day
* At what temperature are the most bike trips taken
* most-used station, least-used station
* who does longer rides? subscriber or non-subscriber?
* most frequent subscriber routes
* detect non-routine routes by subscribers
* derive user id buckets from data (creeeeepy) - they already have this data, why derive it
