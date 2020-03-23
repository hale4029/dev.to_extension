class Container < ApplicationRecord
  has_many :artisanal_collections
  has_many :articles, through: :artisanal_collections

end
