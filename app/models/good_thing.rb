class GoodThing < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: { maximum: 255 }
    validates :praise, presence: true, length: { maximum: 255 }

    has_many :compliments, dependent: :destroy
end
