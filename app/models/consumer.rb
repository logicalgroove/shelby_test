class Consumer < User
  has_many :jobs, dependent: :destroy, foreign_key: :user_id
end
