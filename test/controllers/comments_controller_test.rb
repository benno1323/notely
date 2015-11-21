require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	def setup
		@comment = comments(:one)
		@user = users(:one)
	end

	test "should get index" do
		sign_in @user
		get :index
		assert_response :success
	end
end
