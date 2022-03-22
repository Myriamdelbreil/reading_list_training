class Article < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :description, length: {maximum: 100}
end
