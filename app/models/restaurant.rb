class Restaurant < ApplicationRecord
    validates :name, presence: true
<<<<<<< HEAD
    
=======
    has_one_attached :menu
>>>>>>> d305d2cccdea16aca847a421eb110537a24e074b
end
