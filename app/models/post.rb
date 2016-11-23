class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :image_url

  scope :active, -> {where(archive_date: nil)}
  scope :archived, -> {where.not(archive_date: nil)}

end
