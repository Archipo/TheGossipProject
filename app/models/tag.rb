class Tag < ApplicationRecord
  validates :title, 
  presence: true,
  length: { in: 2..14 }


  has_many :tag_gossip_links
  has_many :gossips, through: :tag_gossip_links
end
