class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :image_url
end
