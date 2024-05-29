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

  def get_profile_image
	　unless profile_image.attached?(width, height)
　　file_path = Rails.root.join('app/assets/images/no_image_jpg')
　　profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  　end
  　profile_image.variant(resize_to_limit: [width, height]).processed
  end


end
