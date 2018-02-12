class Post < ApplicationRecord
    has_many :lists
    has_many :comments
  	validates :title, presence: true,length: { minimum: 5 }
  	

end
