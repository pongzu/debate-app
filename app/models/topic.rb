class Topic < ApplicationRecord

  validates :content, {presence: true, length: {maximum: 40}}
  validates :blue, {presence: true, length: {maximum: 50}}
  validates :red, {presence: true, length: {maximum: 50}}
    
 def user 
  return User.find_by(id: self.users_id)
 end 

end


