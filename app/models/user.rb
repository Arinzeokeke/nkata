class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts #dependent: destroy
  has_many :comments
  validates :username,  :presence => true, :uniqueness => true,
	:length => { :minimum => 2, maximum: 20}
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates :email, 
	:presence => true,
	:length => { :maximum => 100 },
	:format => EMAIL_REGEX,
	:confirmation => true
end
 