module PhotosHelper
  def first_photo
    @featured_photo == @photos.last
  end

  def last_photo
    @featured_photo == @photos.first
  end
end
