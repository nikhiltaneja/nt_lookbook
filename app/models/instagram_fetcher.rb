class InstagramFetcher
  attr_reader :client

  def initialize
    @client = Instagram::Client.new
  end

  def recent_photos
    photos = client.user_recent_media(bonobos_id)
    find_photos(photos)
  end

  def bonobos_id
    user = client.user_search('bonobos')
    user.first.id
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
