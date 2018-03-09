class Post < ApplicationRecord
    has_many :lists
    has_many :comments
  	validates :postText, presence: true,length: { minimum: 5 }
  	

end
