class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article, dependent: :destroy
end
