class Category < ApplicationRecord
    has_many :has_categories, dependent: :destroy
    has_many :articles, through: :has_categories, dependent: :destroy

    belongs_to :user
    validates :name,:color, presence: true
    validates :name, length: {in: 7..20 }
    validates :name, length: {in: 4..10 }

    has_attached_file :coverCat,
     styles: {
         thumb: { geometry: '320x240>', format: :png, convert_options: " -background '#A9BCF5' -gravity center -extent 320x240" },
       #  thum: { geometry: '320x240#', format: :png, convert_options: " -background white -gravity center -extent 300x300" },
         medium: { geometry: '800x600', format: :png, convert_options: " -background white -gravity center -extent 800x600" },
         mini: "400x200>",
         big: "500x500>"},
         default_url: "/images/:style/missing.png"
    validates_attachment_content_type :coverCat, content_type: /\Aimage\/.*\Z/
    
   


end
