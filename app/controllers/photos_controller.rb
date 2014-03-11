class PhotosController < ApplicationController

  def show
    @photos = Photo.all
    
    if params[:id]
      @featured_photo = Photo.find(params[:id])
    else 
      Resque.enqueue(Fetcher)
      @featured_photo = Photo.last
    end 
  end
end
