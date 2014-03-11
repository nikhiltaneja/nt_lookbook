class Fetcher
  @queue = :instagram_queue

  def self.perform
    InstagramFetcher.new.recent_photos
  end
end
