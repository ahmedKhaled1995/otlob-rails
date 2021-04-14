class Item < ApplicationRecord
    validates :name, presence: true
    validates :amount, presence: true
    validates :price, presence: true
    validates :comment, presence: true
end
