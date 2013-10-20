require "spec_helper"

describe YouTubeClient do


  it "should be able to search" do
    results = subject.search("Babson College Campus Tour")
    debugger
    expect(results.size).to be > 0
  end


end