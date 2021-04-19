class Orderfriend < ApplicationRecord
  belongs_to :order
  belongs_to :friend
end
