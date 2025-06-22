class Diary < ApplicationRecord
    has_many :good_things, dependent: :destroy
end
