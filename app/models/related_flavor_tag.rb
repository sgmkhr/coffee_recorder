class RelatedFlavorTag < ApplicationRecord
  belongs_to :flavor_tag
  belongs_to :coffee
end
