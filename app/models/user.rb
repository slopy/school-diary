class User < ActiveRecord::Base
  devise 	:database_authenticatable,
         	:registerable, :recoverable,
        	:rememberable

  validates :email, presence: true, email: true
  validates :password, presence: true
end
