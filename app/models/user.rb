class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :profile_image
  has_many :posts, dependent: :destroy
  
  validates :name, uniqueness: true, presence: true, length: { minimum: 2, maximum: 10 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
end
