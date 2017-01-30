class Channel < ApplicationRecord
	has_many :posts
	before_save :to_lowercase
	validates :name, :presence => true,
	:length => { :minimum => 2}

	def to_lowercase
		self.name = self.name.downcase
	end
end
