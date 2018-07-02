require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get topics_top_url
    assert_response :success
  end

end
