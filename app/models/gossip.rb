class Gossip < ApplicationRecord
  validates :title, 
  presence: true, 
  length: { in: 4..14 }

  validates :content, 
  presence: true

  validates :user_id,
  presence: true

  belongs_to :user
  has_many :tag_gossip_links
  has_many :tags, through: :tag_gossip_links
  has_many :comments
  has_many :sub_comments, through: :comments
  has_many :likes
end
