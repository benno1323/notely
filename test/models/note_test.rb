require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  def setup
  	@note = notes(:one)
  end

  test "should have a title" do
  	@note.title = nil
  	assert_not @note.save
  end

  test "should have content" do
  	@note.content = nil
  	assert_not @note.save
  end

  test "share value should not be nil" do
  	@note.share = nil
  	assert_not @note.save
  end
end
