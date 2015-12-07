require 'rails_helper'

RSpec.describe MyNotesController, type: :controller do
	describe 'GET #index' do
		context 'when user signed in' do
			before(:each) do
				@user = create(:user)
				sign_in @user
			end

			it 'renders the index template' do
				get :index
				expect(response).to render_template(:index)
			end

			it 'assigns a list of notes for the current user' do
				my_note = create(:note, user: @user)
				get :index
				expect(assigns(:my_notes)).to eq([my_note])
			end
		end

		context 'when user not signed in' do
			it 'redirects to users#sign_in' do
				get :index
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end
end