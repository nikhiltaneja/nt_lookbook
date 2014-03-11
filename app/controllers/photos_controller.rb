class PhotosController < ApplicationController

  def show
    Resque.enqueue(Fetcher)
    @photos = Photo.all
    if params[:id]
      @featured_photo = Photo.find(params[:id])
    else 
      @featured_photo = Photo.last
    end 
  end
end
