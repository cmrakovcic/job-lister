class User < ApplicationRecord
    has_many :jobs
    has_many :reviews
    has_many :reviewed_jobs, through: :reviews, source: :job
    has_secure_password
    has_many :categories, through: :jobs

    validates :username, :email, presence: true

    def self.most_active
        @top_users = joins(:jobs).group(:user_id).order("count(user_id) desc").limit(3)
    end
end
