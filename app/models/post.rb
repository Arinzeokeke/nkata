class Post < ApplicationRecord
	belongs_to :user
	belongs_to :channel
	has_many :comments, as: :commentable, dependent: :destroy
	validates :text, :channel_id , :presence => true
	acts_as_votable
end
