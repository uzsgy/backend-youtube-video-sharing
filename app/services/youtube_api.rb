require "uri"
require "net/http"
require "json"

class YoutubeApi < ApplicationController
  def initialize(url)
    @code = url[/.*v=([^&?]*)/, 1]
    puts @code
  end

  def get_video
    video_data = fetch_video
    return nil unless video_data
    puts video_data["items"][0]["snippet"]
    snippet = video_data["items"][0]["snippet"]
    video = Video.new(
      code: @code,
      title: snippet["title"],
      description: snippet["description"],
      thumbnails: snippet["thumbnails"]["maxres"]["url"],
    )
  end

  def create
    get_video(params[:message])
  end

  private

  def fetch_video
    url = URI("https://www.googleapis.com/youtube/v3/videos?id=#{@code}&key=#{ENV["YOUTUBE_API_KEY"]}&part=snippet")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = "no-cache"

    response = http.request(request)

    puts JSON.parse(response.body)
    puts response.code == "200"

    return JSON.parse(response.body) if response.code == "200"
    return nil
  end
end
