class Note < ActiveRecord::Base
	validates :title, :content, presence: true
	validates_inclusion_of :share, in: [true, false]
end
