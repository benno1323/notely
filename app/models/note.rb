class Note < ActiveRecord::Base
	validates :title, :content, :share, presence: true
end
