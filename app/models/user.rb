class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
         
  validates :last_name, presence: false
  validates :first_name, presence: false
  validates :email, presence: false
  validates :nick_name, presence: false, uniqueness: true
  validates :is_active, inclusion: {in: [true, false]}
  
  has_many :coffees, dependent: :destroy
  
end
