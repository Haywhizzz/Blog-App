class AddPaperclipFieldsToArticle < ActiveRecord::Migration[6.0]
  def change
    add_attachment :posts, :image
  end
end
