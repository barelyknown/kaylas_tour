class YouTubeClient

  attr_accessor :client
  def initialize
    @client = YouTubeIt::Client.new(:dev_key => ENV["YOUTUBE_DEV_KEY"])
  end

  def search(query)
    client.videos_by(query: query)
  end
end