class Order < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    has_many :groups 
    has_many :friends
    has_many :items, dependent: :destroy
    enum order_for: [:breakfast, :launch, :dinner]
    delegate :full_name, to: :user, allow_nil: true
    # enum status: [:incomplete, :finish, :waiting]
end
