class PerfumeTag < ApplicationRecord
  validates :name, presence: true, length: {maximum:20}
  
  has_many :related_perfume_tags, dependent: :destroy
  has_many :coffees, through: :related_perfume_tags
end
