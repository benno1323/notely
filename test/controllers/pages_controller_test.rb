require 'test_helper'

class PagesControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  test "should get home" do
    get :home
    assert_response :success
    assert_not_nil assigns(:last_notes)
  end

end
