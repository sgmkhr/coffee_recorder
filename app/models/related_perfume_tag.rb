class RelatedPerfumeTag < ApplicationRecord
  belongs_to :perfume_tag
  belongs_to :coffee
end
