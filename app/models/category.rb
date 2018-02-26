class Category < ApplicationRecord
    has_many :has_categories
    has_many :articles, through: :has_categories

    belongs_to :user
    validates :name,:color, presence: true
    validates :name, length: {in: 7..20 }
    validates :name, length: {in: 4..10 }
end
