class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 300}}

    def user 
        return User.find_by(id: self.users_id)
    end 
    
    
end




