class SubComment < ApplicationRecord
    validates :content, 
    presnce: true

    validates :user_id, 
    presence: true

    validates :comment_id, 
    presence: true

    belongs_to :comment
    belongs_to :user
end
