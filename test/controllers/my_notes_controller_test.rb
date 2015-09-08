require 'test_helper'

class MyNotesControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	def setup
		@user = users(:one)
	end

  test "should get index" do
  	sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:my_notes)
  end

end
