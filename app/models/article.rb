class Article < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_many :tags
end
