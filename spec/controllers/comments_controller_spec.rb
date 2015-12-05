require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	describe "POST #create" do
		context "with valid attributes" do
			before(:each) do
				@user = create(:user)
				@note = create(:note)
				sign_in @user
			end

			it 'saves a comment in the database' do
				expect{
					post :create, note_id: @note.id,
					comment: { content: 'My comment', note_id: @note.id, user_id: @user.id }
					}.to change(Comment, :count).by(1)
				end

				it "redirect to notes#show" do
					post :create, note_id: @note.id,
					comment: { content: 'My comment', note_id: @note.id, user_id: @user.id }
					expect(response).to redirect_to(note_path(@note))
				end
			end
		end

		context "with invalid attributes" do
			before(:each) do
				@user = create(:user)
				@note = create(:note)
				sign_in @user
			end

			it 're-renders notes#show' do
				invalid_attributes = { content: '', note_id: @note.id, user_id: @user.id }
				post :create, note_id: @note.id,
				comment: invalid_attributes
				expect(response).to render_template(:show)
			end
		end
	end