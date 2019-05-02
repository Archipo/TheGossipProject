require 'test_helper'

class GossipControllerTest < ActionDispatch::IntegrationTest
  test "should get show_gossips" do
    get gossip_show_gossips_url
    assert_response :success
  end

end
