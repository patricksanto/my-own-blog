class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 20 }, uniqueness: true
  validates :body, presence: true, length: { minimum: 50 }
end
