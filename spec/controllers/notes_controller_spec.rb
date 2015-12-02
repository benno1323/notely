require 'rails_helper'

RSpec.describe NotesController, type: :controller do

	describe 'GET #show' do
		let(:valid_attributes) { { content: 'Test comment', note_id: @note.id, user_id: @user.id } }

		before(:each) do
			@note = Note.create(title: 'MyTitle', content: 'My Note', user_id: 1)
			@user = User.create(email: 'ben@example.com', password: '12345678',
				password_confirmation: '12345678')
		end

		context 'with valid attributes' do
			it 'saves a new comment in the database' do
				get :show, note_id: @note.id
				expect {
					post :create,
						comment: valid_attributes
					}.to change(Comment, :count).by(1)
				end
			end
		end
	end