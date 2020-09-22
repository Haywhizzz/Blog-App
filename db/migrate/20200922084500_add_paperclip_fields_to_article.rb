# frozen_string_literal: true

class AddPaperclipFieldsToArticle < ActiveRecord::Migration[6.0]
  def change
    add_attachment :articles, :image
  end
end
