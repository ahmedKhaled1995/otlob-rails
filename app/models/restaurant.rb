class Restaurant < ApplicationRecord
    validates :name, presence: true
    has_one_attached :menu
end
