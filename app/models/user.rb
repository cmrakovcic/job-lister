class User < ApplicationRecord
    has_many :jobs
    has_many :reviews
    has_many :reviewed_jobs, through: :reviews, source: :job
    has_secure_password
    has_many :categories, through: :jobs
end
