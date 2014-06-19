require 'test_helper'

class WelcomeradioselectControllerTest < ActionController::TestCase
  test "should get yourbuses" do
    get :yourbuses
    assert_response :success
  end

  test "should get yourbuses_dropdown" do
    get :yourbuses_dropdown
    assert_response :success
  end

end
