class HasCategory < ApplicationRecord
  belongs_to :article, dependent: :destroy
  belongs_to :category
end
