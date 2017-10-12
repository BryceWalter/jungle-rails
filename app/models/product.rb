class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def new_review(review_params, current_user)
    user ||= current_user
    attributes = review_params
    attributes[:user] = user
    self.reviews.new(attributes)
  end

end
