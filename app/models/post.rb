class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 300}}

    def user 
        return User.find_by(id: self.users_id)
    end 
    
    def position
        return Position.find_by(user_id: self.users_id, topic_id: self.topic_id)
    end
end




