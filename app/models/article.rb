class Article < ApplicationRecord
    include PermissionsConcern
    has_many :has_categories, dependent: :destroy
    has_many :categories, through: :has_categories, dependent: :nullify
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

    has_attached_file :cover,
     styles: {
         thumb: { geometry: '320x240>', format: :png, convert_options: " -background '#A9BCF5' -gravity center -extent 320x240" },
       #  thum: { geometry: '320x240#', format: :png, convert_options: " -background white -gravity center -extent 300x300" },
         medium: { geometry: '800x600', format: :png, convert_options: " -background white -gravity center -extent 800x600" },
         mini: "400x200>",
         big: "500x500>"},
         default_url: "/images/:style/missing.png"
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
    
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