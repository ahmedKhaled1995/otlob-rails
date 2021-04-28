class Restaurant < ApplicationRecord
    validates :name, presence: true
    has_one_attached :menu
    validate :correct_image_type

    private
        def correct_image_type
            if menu.attached? && ( !menu.content_type.in?(%w(image/jpeg image/png)) || menu.blob.byte_size > 3000000)
                errors.add(:menu, "Must be jpeg or png")
            end
        end
end
