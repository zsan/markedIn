class Postimage < ActiveRecord::Base
  attr_accessible :name, :image
  belongs_to :micropost
  mount_uploader :image, PostimageUploader


  #why ?
  #validates :micropost_id, presence: true
  #validates :name, presence: true, length: { maximum: 140 }
end
