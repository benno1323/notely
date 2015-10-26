require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
  	@comment = comments(:one)
  end

  test "should have content" do
  	@comment.content = nil
  	assert_not @comment.save
  end

  test "should have user id" do
  	@comment.user_id = nil
  	assert_not @comment.save
  end
end
