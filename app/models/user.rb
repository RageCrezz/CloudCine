class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :security_question_1, :security_question_2, presence: true

  has_secure_password :security_answer_1
  has_secure_password :security_answer_2
end
