require 'rails_helper'

RSpec.describe Comment, type: :model do
	it 'is valid with a content, note_id and user_id' do
		comment = create(:comment)
		comment.valid?
		expect(comment).to be_valid
	end

	it 'is invalid without a content' do
		comment = build(:comment, content: nil)
		comment.valid?
		expect(comment.errors[:content]).to include("can't be blank")
	end

	it 'is invalid without a user_id' do
		comment = build(:comment, user_id: nil)
		comment.valid?
		expect(comment.errors[:user_id]).to include("can't be blank")
	end

	it 'is invalid without a note_id' do
		comment = build(:comment, note_id: nil)
		comment.valid?
		expect(comment.errors[:note_id]).to include("can't be blank")
	end
end