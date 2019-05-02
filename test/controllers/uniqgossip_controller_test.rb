require 'test_helper'

class UniqgossipControllerTest < ActionDispatch::IntegrationTest
  test "should get showgossip" do
    get uniqgossip_showgossip_url
    assert_response :success
  end

end
