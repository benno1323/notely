require 'rails_helper'

RSpec.describe NotesController, type: :controller do

	describe 'GET #index' do
		context 'when user is signed in' do
			before(:each) do
				@user = create(:user)
				@note = create(:note)
				sign_in @user
			end

			it 'renders the index template' do
				get :index
				expect(response).to render_template(:index)
			end

			it 'assigns a list of public notes' do
				@note = create(:note, :public)
				get :index
				expect(assigns(:notes)).to eq([@note])
			end

			it 'does not assign a list of private notes' do
				get :index
				expect(assigns(:notes)).to be_empty
			end
		end

		context 'when user is not signed in' do
			it 'redirects to users#sign_in' do
				get :index
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end

	describe 'GET #show' do
		context 'when user signed in' do
			before(:each) do
				@user = create(:user)
				@note = create(:note)
				sign_in @user
			end

			it 'renders the show template' do
				get :show, id: @note
				expect(response).to render_template(:show)
			end

			it 'assigns a note to be shown' do
				get :show, id: @note
				expect(assigns(:note)).to eq(@note)
			end

			it 'loads last 5 comments of a note' do
				@note = create(:note_with_comments, comments_count: 10)
				expect(@note.comments.last(5).length).to eq(5)
			end
		end

		context 'when user not signed in' do
			it 'redirects to users#sign_in' do
				note = create(:note)
				get :show, id: note.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end

	describe 'GET #new' do
		before(:each) do
			user = create(:user)
			sign_in user
		end

		it 'assigns a new note' do
			get :new
			expect(assigns(:note)).to be_a_new(Note)
		end

		it 'renders the new template' do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe 'GET #edit' do
		context 'when user signed in' do
			before(:each) do
				user = create(:user)
				@note = create(:note)
				sign_in user
			end

			it 'retrieves a note from the database' do
				get :edit, id: @note.id
				expect(assigns(:note)).to eq(@note)
			end

			it 'renders the edit template' do
				get :edit, id: @note.id
				expect(response).to render_template(:edit)
			end
		end

		context 'when user not signed in' do
			before(:each) do
				@note = create(:note)
			end

			it 'redirects to users#sign in' do
				get :edit, id: @note.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end

	describe 'POST #create' do
		context 'when user signed in' do
			context 'with valid attributes' do
				before(:each) do
					user = create(:user)
					sign_in user
				end

				it 'saves a new note to the database' do
					expect{
						post :create,
							note: attributes_for(:note)
						}.to change(Note, :count).by(1)
				end

				it 'redirects to notes#show' do
					post :create, note: attributes_for(:note)
					expect(response).to redirect_to(note_path(assigns(:note)))
				end
			end

			context 'with invalid attributes' do
				before(:each) do
					@note = create(:note)
					user = create(:user)
					sign_in user
				end

				it 'does not save the note in the database' do
					expect{
						post :create, note: attributes_for(:note, title: nil, content: nil, share: nil)
					}.to_not change(Note, :count)
				end

				it 're-renders the new template' do
					post :create, note: attributes_for(:note, title: nil, content: nil, share: nil)
					expect(response).to render_template(:new)
				end
			end
		end

		context 'when user not signed in' do
			it 'redirects to users#sign' do
				@note = create(:note)
				post :create, note: attributes_for(:note)
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end

	describe 'PATCH #update' do
		context 'when user is signed in' do
			context 'with valid attributes' do
				before(:each) do
					user = create(:user)
					@note = create(:note)
					sign_in user
				end

				it 'locates a note in the database' do
					patch :update, id: @note.id, note: attributes_for(:note)
					expect(assigns(:note)).to eq(@note)
				end

				it 'changes a note attributes' do
					patch :update, id: @note.id,
						note: attributes_for(:note, share: true)
					@note.reload
					expect(@note.share).to eq(true)
				end

				it 'redirects to the updated note' do
					patch :update, id: @note.id, note: attributes_for(:note)
					expect(response).to redirect_to(@note)
				end
			end

			context 'with invalid attributes' do
				before(:each) do
					@note = create(:note)
					user = create(:user)
					sign_in user
				end

				it 'does not change a note attributes' do
					expect{
						patch :update, id: @note.id,
							note: attributes_for(:note, title: '')
						}.to_not change(Note, :count)
				end

				it 're-renders the edit template' do
					patch :update, id: @note.id, note: attributes_for(:note, title: '')
					expect(response).to render_template(:edit)
				end
			end
		end

		context 'when user is not signed in' do
			it 'redirects to users#sign_in' do
				@note = create(:note)
				patch :update, id: @note.id, note: attributes_for(:note)
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end

	describe 'DELETE #destroy' do
		context 'when user signed in' do
			before(:each) do
				user = create(:user)
				@note = create(:note)
				sign_in user
			end

			it 'retrieves a note from the database' do
				delete :destroy, id: @note.id
				expect(assigns(:note)).to eq(@note)
			end

			it 'destroys a note' do
				expect{
					delete :destroy, id: @note.id
					}.to change(Note, :count).by(-1)
			end

			it 'redirects to notes#index' do
				delete :destroy, id: @note.id
				expect(response).to redirect_to(notes_url)
			end
		end

		context 'when user not signed in' do
			it 'redirects to users#sign_in' do
				@note = create(:note)
				delete :destroy, id: @note.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end
end