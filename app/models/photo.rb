class Photo < ActiveRecord::Base
  validates :standard_url, presence: true, uniqueness: true
  validates :thumbnail_url, presence: true, uniqueness: true
end
