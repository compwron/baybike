require_relative "spec_helper"

describe StationHistories do
  date_time02 = DateTime.new(2014, 2, 28, 22, 20, 2)
  date_time03 = DateTime.new(2014, 2, 28, 22, 20, 3)

  describe "#add" do
    it "should add one station history" do
      sh = StationHistories.new()
      sh.add('"83","8","7","2014/02/28 22:20:02"')

      sh.station_histories.size.should == 1

      sh.station_histories[0].should == StationHistory.new(83, [BikeLevel.new(date_time02, 8)])
    end

    it "should not add lines identical except timestamp" do
      sh = StationHistories.new()
      sh.add('"83","8","7","2014/02/28 22:20:02"')
      sh.add('"83","8","7","2014/02/28 22:20:03"')

      sh.station_histories.size.should == 1

      sh.station_histories[0].should == StationHistory.new(83, [BikeLevel.new(date_time02, 8)])
    end

    it "should add new station as separate history" do
      sh = StationHistories.new()
      sh.add('"83","8","7","2014/02/28 22:20:02"')
      sh.add('"84","9","6","2014/02/28 22:20:03"')

      sh.station_histories.size.should == 2
      sh.station_histories[0].should == StationHistory.new(83, [BikeLevel.new(date_time02, 8)])
      sh.station_histories[1].should == StationHistory.new(84, [BikeLevel.new(date_time03, 9)])
    end

    it "should add new number of bikes in station in same history" do
      sh = StationHistories.new()
      sh.add('"83","8","7","2014/02/28 22:20:02"')
      sh.add('"83","9","6","2014/02/28 22:20:03"')

      sh.station_histories.size.should == 1

      bike_levels = [BikeLevel.new(date_time02, 8), BikeLevel.new(date_time03, 9)]
      sh.station_histories[0].should == StationHistory.new(83, bike_levels)
    end
  end
end