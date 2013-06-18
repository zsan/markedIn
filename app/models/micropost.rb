class Micropost < ActiveRecord::Base
  attr_accessible :content, :title, :postimages_attributes
  belongs_to :user
  has_many :postimages, dependent: :destroy
  accepts_nested_attributes_for :postimages, :allow_destroy => true

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 70 }
  validates :content, presence: true, length: { maximum: 255 }

  default_scope order: 'microposts.created_at DESC'


  def self.from_users_followed_by(user)
  	followed_user_ids = "SELECT followed_id from relationships WHERE follower_id = :user_id"
  	where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
  		user_id: user.id)
  end
end
