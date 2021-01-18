require "test_helper"

class AdvicePostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get advice_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get advice_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get advice_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get advice_posts_edit_url
    assert_response :success
  end
end
