class Job < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_many :users, through: :reviews

  scope :alpha, -> { order(:title) }
  scope :most_reviews, -> { joins(:reviews).group('jobs.id').order('count(jobs.id) desc') }

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end
end
