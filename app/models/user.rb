class User < ApplicationRecord
    validates :name, {presence: true}
    validates :password, {presence: true}

  def topics
    return Topic.where(users_id: self.id)
  end

end
