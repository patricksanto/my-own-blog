class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 20 }, uniqueness: true
  validates :body, presence: true, length: { minimum: 50 }

  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where('published_at <= ?', Time.current) }
  scope :schedule, -> { where('published_at > ?', Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at.present? && published_at <= Time.current
  end

  def scheduled?
    published_at.present? && published_at > Time.current
  end
end
