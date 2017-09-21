class Job < ApplicationRecord
  belongs_to :consumer, foreign_key: :user_id

  monetize :price_cents

  validates :title, presence: true
end
