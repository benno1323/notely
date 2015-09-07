class Note < ActiveRecord::Base
	validates :title, :content, :user_id, presence: true
	validates_inclusion_of :share, in: [true, false]
	belongs_to :user
end
