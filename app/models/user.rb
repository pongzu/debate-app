class User < ApplicationRecord

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower



  def following?(a)
    following.include?(a)
  end


  validates :name, {presence: true}
  validates :password, {presence: true}

  def topics
    return Topic.where(users_id: self.id)
  end

end


