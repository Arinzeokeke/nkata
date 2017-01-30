class Comment < ApplicationRecord
	acts_as_votable
	belongs_to :commentable, polymorphic: true
	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy
	validates :text, presence: true
	validates :user_id, presence: true
end
