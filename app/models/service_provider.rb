class ServiceProvider < User
  has_many :jobs, foreign_key: :provider_id, dependent: :nullify
end
