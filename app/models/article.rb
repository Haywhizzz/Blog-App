# frozen_string_literal: true

class Article < ApplicationRecord
  attr_accessor :image_file_name
  def tag_list
    tags.collect(&:name).join(', ')
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(',').collect { |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png'] }
end
