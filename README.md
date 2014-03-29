Poking around with the data set from https://bayareabikeshare.com/datachallenge

assuming installed and running mongo:

import data to mongo:
```mongoimport -d baybike -c trips --type csv --file 201402_trip_data.csv --headerline
mongoimport -d baybike -c station --type csv --file 201402_station_data.csv --headerline
mongoimport -d baybike -c weather --type csv --file 201402_weather_data.csv --headerline
mongoimport -d baybike -c rebalancing --type csv --file 201402_rebalancing_data.csv --headerline

```

open mongo:
```mongo```

view data:
```use baybike
	db.trips.find().pretty()
```



done:
- bike id with most trips: id: 510, count: 482
- Most used day was: Thursday with usage of: 25265

ideas for things to look for:

days with fewest rentals (what is the number of rentals on the day with the smallest rentals?)

most used, least used bike

day with fewest trips

least often used bike id

average lifetime of bikes

spread of most-used and least-used bikes

longest checked out bike
longest trip?

hour with most bikes checked out per day

find all multi-day rentals

day with worst weather: find bike usage on that day

bike station affinity rating per bike 

bike that's moved the least

hottest day, coldest day, see how many rentals are on that day

At what temperature are the most bike trips taken

most-used station, least-used station

who does longer rides? subscriber or non-subscriber?

most frequent subscriber routes

detect non-routine routes by subscribers

derive user id buckets from data (creeeeepy) - they already have this data, why derive it

in progress: 
day of week that bikes are most used?