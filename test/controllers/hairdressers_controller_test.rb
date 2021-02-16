require 'test_helper'

class HairdressersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hairdressers_index_url
    assert_response :success
  end

end
