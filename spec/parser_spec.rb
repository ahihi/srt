require 'srt'

describe SRT::Parser do
  subject { described_class }

  describe ".id" do
    it "should convert the id string (#[id]) to an int representing the sequence number" do
      subject.id("#317").should eq(317)
    end
  end

  describe ".timecode" do
    it "should convert the SRT timecode format to a float representing seconds" do
      subject.timecode("01:03:44,200").should eq(3824.2)
    end
  end

  describe ".timespan" do
    it "should convert a timespan string ([+|-][amount][h|m|s|ms]) to a float representing seconds" do
      subject.timespan("-3.5m").should eq(-210)
    end

    it "should convert a timespan string ([+|-][amount][h|m|s|ms]) to a float representing seconds" do
      subject.timespan("-1s").should eq(-1)
    end

    it "should convert a timespan string ([+|-][amount][h|m|s|ms]) to a float representing seconds" do
      subject.timespan("100ms").should eq(0.1)
    end
  end

  describe ".parse_framerate" do
    it "should convert a framerate string ([number]fps) to a float representing seconds" do
      subject.framerate("23.976fps").should eq(23.976)
    end
  end
end
