class Article < ApplicationRecord
    include PermissionsConcern
    has_many :has_categories
    has_many :categories, through: :has_categories
    after_create :save_categoryMetodo
    belongs_to :user
    validates :title, uniqueness: true
    validates :title,:body, presence: true
    validates :title, length: {in: 5..13 }
    validates :body, length: {minimum: 450, too_short: "Minimo son %{count} caracteres" }
    scope :ultimos, -> {order("created_at DESC")}
    scope :ult, -> {where(title: "Registro")} 
    scope :titulo, -> (title) { where("lower (title) LIKE ?", "%#{title}%") } 
  #  scope :titulo, -> (find_titulo) {where title: find_titulo}

    def categoryMetodo=(value)
        @categories = value
        #raise value.to_yaml
    end     
    private
    def save_categoryMetodo
            @categories.each do |category_id|
             #  raise "category_id #{category_id} article_id #{self.id}"
                HasCategory.create(category_id: category_id, article_id: self.id )
        end
    end
end