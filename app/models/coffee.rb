class Coffee < ApplicationRecord
  belongs_to :user
  
  has_one_attached :coffee_image
  
  has_many :perfume_tags, through: 'Related_perfume_tag'
  has_many :flavor_tags, through: 'Related_flavor_tag'
  
  validates :name, presence: true
  validates :shop, length: {maximum:20}
  validates :introduction, length: {maximum:200}
  
  enum place: { home: 0, shop: 1, outside: 2, other: 3 }
  enum total_rate: { fantastic: 0, great: 1, good: 2, normal: 3, bad: 4, worst: 5 } 
  enum acidit_rate: { very_strong: 0, strong: 1, moderate: 2, weak: 3, very_weak: 4 }
  enum richness_rate: { very_strong: 0, strong: 1, moderate: 2, weak: 3, very_weak: 4 }
  enum bitterness_rate: { very_strong: 0, strong: 1, moderate: 2, weak: 3, very_weak: 4 }
  
end
