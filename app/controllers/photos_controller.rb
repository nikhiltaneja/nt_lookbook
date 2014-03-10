class PhotosController < ApplicationController
  def index
    InstagramFetcher.new.find_photos
    @photos = Photo.all
  end
end
