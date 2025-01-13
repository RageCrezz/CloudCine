class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         authentication_keys: [ :username ]

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
end
