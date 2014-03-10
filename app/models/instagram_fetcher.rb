require "instagram"

class InstagramFetcher
  attr_reader :client

  def initialize
    @client = Instagram::Client.new
  end

  def find_photos
    user = client.user_search('bonobos')
    bonobos_id = user.first.id
    photos = client.user_recent_media(bonobos_id)
    photos.reverse.each do |photo|
      Photo.find_or_create_by(
        standard_url: photo.images["standard_resolution"]["url"],
        thumbnail_url: photo.images["thumbnail"]["url"]
        )
    end
  end
end
