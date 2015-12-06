require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	describe 'POST #create' do
		context 'with valid attributes' do
			before(:each) do
				user = create(:user)
				@note = create(:note)
				sign_in user
			end

			it 'saves a comment in the database' do
				expect{
					post :create, note_id: @note.id,
						comment: attributes_for(:comment)
					}.to change(Comment, :count).by(1)
				end

				it 'redirect to notes#show' do
					post :create, note_id: @note.id,
					comment: attributes_for(:comment)
					expect(response).to redirect_to(@note)
				end
			end
		end

		context 'with invalid attributes' do
			before(:each) do
				user = create(:user)
				@note = create(:note)
				sign_in user
			end

			it 're-renders notes#show' do
				post :create, note_id: @note.id,
				comment: attributes_for(:comment, content: '')
				expect(response).to render_template(:show)
			end
		end

		context 'when user is not signed in' do
			it 'redirects to users#sign_in' do
				@note = create(:note)
				post :create, note_id: @note.id,
					comment: attributes_for(:comment)
					expect(response).to redirect_to(new_user_session_path)
			end
		end
	end