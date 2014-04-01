require_relative "spec_helper"

describe Display do

  describe "#==" do
    it "should display 1x1 emptiness" do
      display = Display.new(1, 1)
      display.to_s.should == "1 -\n  1"
    end

    it "should display 2x2 emptiness" do
      display = Display.new(2, 2)
      display.to_s.should == "2 - -\n1 - -\n  1 2"
    end

    it "should display 1x1 with station1 with 1 bike" do
      display = Display.new(1, 1)
      display.apply(1, 1)
      display.to_s.should == "1 o\n  1"
    end

    it "should display 2x2 with no bikes" do
      display = Display.new(2, 2)
      display.apply(0, 1)
      display.to_s.should == "2 - -\n1 - -\n  1 2"
    end

    it "should display 1 station with max of 2 bikes with 1 bike at station 1" do
      display = Display.new(2, 1)
      display.apply(1, 1)
      display.to_s.should == "2 -\n1 o\n  1"
    end

  end
end