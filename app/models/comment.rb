class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :note
	validates :content, :user_id, presence: true
end
