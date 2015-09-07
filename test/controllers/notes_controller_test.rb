require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @note = notes(:one)
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create note" do
    sign_in @user
    assert_difference('Note.count') do
      post :create, note: { title: @note.title, content: @note.content, share: @note.share, user: @user }
    end

    assert_redirected_to note_path(assigns(:note))
  end

  test "should show note" do
    sign_in @user
    get :show, id: @note
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @note
    assert_response :success
  end

  test "should update note" do
    sign_in @user
    valid_attribute = { share: true }
    patch :update, id: @note, note: valid_attribute
    assert_redirected_to note_path(assigns(:note))
  end

  test "should destroy note" do
    sign_in @user
    assert_difference('Note.count', -1) do
      delete :destroy, id: @note
    end

    assert_redirected_to notes_path
  end
end
