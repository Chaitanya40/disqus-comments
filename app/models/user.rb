class User < ApplicationRecord
	has_secure_password
	has_many :questions
	has_many :comments
	has_many :replies
end
