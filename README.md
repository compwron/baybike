# Bay Area Bike Share Open Data Challenge
* Live JSON feed http://www.bayareabikeshare.com/stations/json
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

# Extrapolation Stories/Mash-ups
* Predict bike availability during a certain time window
* How much money does the city save by having people ride these bikes?
* CO2 saved with reduced public transit/driving
* Track a subscriber/bike and map its routes with street view
* Bike couples. Find bikes rented at approx the same time at the same place. What bikes end up at the same racks?
* Top 10 restaurants - What restaurants are benefitting from bike share?
* Most bike share friendly/green SF neighborhoods
  * Get more information about subscriber profiles - zip code, neighborhood, property values, median income
* Compare east coast vs west coast bike shares

# Questions we have about the data

## Currently in progress:
* day of week that bikes are most used?

## Finished:
* bike id with most trips: id: 510, count: 482
* Most used day was: Thursday with usage of: 25265
* Most frequent subscriber routes - [See it on a map](http://pamo.github.io/baybike/map.html)
```
Count: 	 1253 	 Start: Townsend at 7th 	 End: San Francisco Caltrain (Townsend at 4th)
Count: 	 1044 	 Start: San Francisco Caltrain 2 (330 Townsend) 	 End: Townsend at 7th
Count: 	 820 	 Start: Market at Sansome 	 End: 2nd at South Park
Count: 	 763 	 Start: 2nd at South Park 	 End: Market at Sansome
Count: 	 680 	 Start: San Francisco Caltrain (Townsend at 4th) 	 End: Harry Bridges Plaza (Ferry Building)
Count: 	 678 	 Start: San Francisco Caltrain (Townsend at 4th) 	 End: Embarcadero at Folsom
Count: 	 673 	 Start: Embarcadero at Sansome 	 End: Steuart at Market
Count: 	 621 	 Start: 2nd at Townsend 	 End: Harry Bridges Plaza (Ferry Building)
Count: 	 620 	 Start: San Francisco Caltrain (Townsend at 4th) 	 End: Temporary Transbay Terminal (Howard at Beale)
Count: 	 609 	 Start: Steuart at Market 	 End: 2nd at Townsend
```
* days with fewest rentals (what is the number of rentals on the day with the smallest rentals?)
* most used, least used bike
* day with fewest trips
* least often used bike id
* usage per day commandline visual (looks lower on Sat/Sun)
```
02/07/2014 Fri ||||||||||||||||||||
02/08/2014 Sat ||||
02/09/2014 Sun |||
02/10/2014 Mon ||||||||||||||||||||||||||||||||||
02/11/2014 Tue ||||||||||||||||||||||||||||||||||||||||
02/12/2014 Wed ||||||||||||||||||||||||||||||||||||||||||||
02/13/2014 Thu ||||||||||||||||||||||||||||||||||||||||
02/14/2014 Fri |||||||||||||||||||||||||||||||||||||||||
02/15/2014 Sat ||||||||||||||||||
02/16/2014 Sun ||||||||||||||||||
02/17/2014 Mon ||||||||||||||||||||
02/18/2014 Tue ||||||||||||||||||||||||||||||||||||||||||||
02/19/2014 Wed ||||||||||||||||||||||||||||||||||||||||||||
02/20/2014 Thu ||||||||||||||||||||||||||||||||||||||||||
02/21/2014 Fri ||||||||||||||||||||||||||||||||||||||||
02/22/2014 Sat ||||||||||||||||||||
02/23/2014 Sun |||||||||||||
02/24/2014 Mon |||||||||||||||||||||||||||||||||||||||||||
02/25/2014 Tue |||||||||||||||||||||||||||||||||||||||||||||||
02/26/2014 Wed |||||||||||||||||
02/27/2014 Thu |||||||||||||||||||||||||||||||||||||
02/28/2014 Fri |||||||||||||||||||||||
```

## To Do:
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
* detect non-routine routes by subscribers
* derive user id buckets from data (creeeeepy) - they already have this data, why derive it
* first rental of the day at each station per day
