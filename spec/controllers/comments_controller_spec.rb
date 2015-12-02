require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	# describe 'POST #create' do
	# 	user = User.create(email: 'ben@example.com', password: '12345678',
	# 								 password_confirmation: '12345678')
	# 	note = Note.create(title: 'Test Note', content: 'My Note', user_id: 5)
	# 	let(:valid_attributes) { { content: 'Test comment', note_id: note.id, user_id: user.id } }

	# 	before(:each) do
	# 	end

	# 	context 'with valid attributes' do
	# 		it 'saves a comment in the database' do
	# 			get :show, id: note.id
	# 			expect{
	# 				post :create,
	# 					comment: valid_attributes
	# 			}.to change(Note, :count).by(1)
	# 		end

	# 		it 'redirects to notes#show'
	# 	end

	# 	context 'with invalid attributes' do
	# 		it 're-renders the notes/show template'
	# 	end
	# end
end