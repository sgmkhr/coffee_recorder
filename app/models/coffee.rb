class Coffee < ApplicationRecord
  belongs_to :user

  has_one_attached :coffee_image

  has_many :related_flavor_tags, dependent: :destroy
  has_many :related_perfume_tags, dependent: :destroy

  has_many :perfume_tags, through: :related_perfume_tags
  has_many :flavor_tags, through: :related_flavor_tags

  validates :name, presence: true
  validates :shop, length: {maximum:20}
  validates :introduction, length: {maximum:200}

  enum place: { home: 0, shop: 1, outside: 2, other: 3 }
  enum total_rate: { fantastic: 0, great: 1, good: 2, normal: 3, bad: 4, worst: 5 }
  enum acidit_rate: { acidit_very_strong: 0, acidit_strong: 1, acidit_moderate: 2, acidit_weak: 3, acidit_very_weak: 4 }
  enum richness_rate: { richness_very_strong: 0, richness_strong: 1, richness_moderate: 2, richness_weak: 3, richness_very_weak: 4 }
  enum bitterness_rate: { bitterness_very_strong: 0, bitterness_strong: 1, bitterness_moderate: 2, bitterness_weak: 3, bitterness_very_weak: 4 }

  def get_coffee_image
	　unless coffee_image.attached?(width, height)
　　file_path = Rails.root.join('app/assets/images/coffee_default_image.png')
　　coffee_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
  　end
  　coffee_image.variant(resize_to_limit: [width, height]).processed
  end
end
