class AddColumnCoverToCategory < ActiveRecord::Migration[5.1]
  def change
    add_attachment :categories, :coverCat
  end
end
