class Compliment < ApplicationRecord
  belongs_to :user
  belongs_to :good_thing

  validates :content, presence: true, length: { maximum: 100 }
end
