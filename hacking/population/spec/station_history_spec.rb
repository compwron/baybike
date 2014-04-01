require_relative "spec_helper"

describe StationHistory do

  describe "#==" do
    it "should be equal to an equal station history level" do
      StationHistory.new(1, []).should == StationHistory.new(1, [])
    end

  end
end