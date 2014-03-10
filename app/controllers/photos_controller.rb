class PhotosController < ApplicationController
  def index
    InstagramFetcher.new.recent_photos
    @photos = Photo.all
    @photo = Photo.last
  end
end
