class Article < ApplicationRecord
    belongs_to :user
    validates :title,:body, presence: true
    validates :title, length: {in: 5..25 }
    validates :body, length: {minimum: 50, too_short: "Minimo son %{count} caracteres" }
end