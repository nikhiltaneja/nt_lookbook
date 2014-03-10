class PhotosController < ApplicationController
  def index
    InstagramFetcher.new.recent_photos
    @photos = Photo.all
    @featured_photo = Photo.last
  end

  def show
    @photos = Photo.all
    @featured_photo = Photo.find(params[:id])
  end
end
