require 'test_helper'

class RetweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get retweets_index_url
    assert_response :success
  end

  test "should get show" do
    get retweets_show_url
    assert_response :success
  end

  test "should get new" do
    get retweets_new_url
    assert_response :success
  end

  test "should get update" do
    get retweets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get retweets_destroy_url
    assert_response :success
  end

end
