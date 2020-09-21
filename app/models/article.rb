class Article < ApplicationRecord

    def tag_list
  self.tags.collect do |tag|
    tag.name
  end.join(", ")
    end

    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings
end




