require_relative "spec_helper"

describe BikeLevel do

  describe "#==" do
    it "should be equal to an equal bike level" do
       BikeLevel.new(DateTime.new(2014, 2, 28, 22, 20, 2), 1).should == BikeLevel.new(DateTime.new(2014, 2, 28, 22, 20, 2), 1)
    end

  end
end