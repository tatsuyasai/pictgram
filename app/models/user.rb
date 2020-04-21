class User < ApplicationRecord
  validates :name , presence: true , length: {maximum: 15}
  validates :email , presence: true , format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  
  has_secure_password
  
  validates :password , length: {minimum: 8 , maximum: 32} , format: {with: /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/}
  validates :password_confirmation , length: {minimum: 8 , maximum: 32} 
  
  has_many :topics
end
