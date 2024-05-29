class FlavorTag < ApplicationRecord
  validates :name, presence: true, length: {maximum:20}
  
  has_many :related_flavor_tags, dependent: :destroy
  has_many :coffees, through: :related_flavor_tags
end
