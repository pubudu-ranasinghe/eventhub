require 'test_helper'

class AdministratorControllerTest < ActionController::TestCase
  test "should get pending" do
    get :pending
    assert_response :success
  end

end
