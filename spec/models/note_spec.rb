require 'rails_helper'

RSpec.describe Note, type: :model do
	it 'is valid with title, content, share, user_id' do
		note = create(:note)
		expect(note).to be_valid
	end

	it 'is invalid without a title' do
		note = build(:note, title: nil)
		note.valid?
		expect(note.errors[:title]).to include("can't be blank")
	end

	it 'is invalid without a content' do
		note = build(:note, content: nil)
		note.valid?
		expect(note.errors[:content]).to include("can't be blank")
	end

	it 'is invalid without a user' do
		note = build(:note, user_id: nil)
		note.valid?
		expect(note.errors[:user_id]).to include("can't be blank")
	end

	it 'validates share is boolean' do
		note = build(:note)
		expect(note[:share]).to be_in([true, false])
	end
end