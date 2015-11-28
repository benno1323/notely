require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	def setup
		@comment = comments(:one)
		@user = users(:one)
	end

	test "assert the true" do
		true
	end
end
