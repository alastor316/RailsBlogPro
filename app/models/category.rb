class Category < ApplicationRecord
    belongs_to :user
    validates :name,:color, presence: true
    validates :name, length: {in: 7..20 }
    validates :name, length: {in: 4..7 }
end
