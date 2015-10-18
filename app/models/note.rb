class Note < ActiveRecord::Base
	validates :title, :content, :user_id, presence: true
	validates_inclusion_of :share, in: [true, false]
	belongs_to :user

	def boolean_to_text
		self.share ? 'Public' : 'Private'
	end
end
