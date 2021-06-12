require "test_helper"

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get game" do
    get game_game_url
    assert_response :success
  end
end
