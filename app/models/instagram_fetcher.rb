class InstagramFetcher
  
  BONOBOS_ID = "8194723"

  attr_reader :client

  def initialize
    @client = Instagram::Client.new
  end

  def recent_photos
    photos = client.user_recent_media(BONOBOS_ID)
    find_photos(photos)
  end

  def find_photos(photos)
    photos.reverse.each do |photo|
      Photo.find_or_create_by(
        standard_url: photo.images["standard_resolution"]["url"],
        thumbnail_url: photo.images["thumbnail"]["url"]
        )
    end
  end
end
