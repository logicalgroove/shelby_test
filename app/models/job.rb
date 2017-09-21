class Job < ApplicationRecord
  belongs_to :user
  belongs_to :service_provider, foreign_key: :provider_id, required: false

  monetize :price_cents

  validates :title, presence: true

  default_scope -> { order(created_at: :desc) }

  def accepted_by?(user)
    provider_id == user&.id
  end

  def accept!(user)
    return if provider_id

    self.update!(provider_id: user&.id)
  end

  def cancel!(user)
    return unless accepted_by?(user)

    self.update!(provider_id: nil)
  end
end
