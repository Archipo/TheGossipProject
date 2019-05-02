require 'test_helper'

class AuthorControllerTest < ActionDispatch::IntegrationTest
  test "should get authorinfos" do
    get author_authorinfos_url
    assert_response :success
  end

end
