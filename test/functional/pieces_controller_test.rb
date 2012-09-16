require 'test_helper'

class PiecesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:markers)
  end

  test "should show piece" do
    get :show
    assert_response :success
    assert_not_nil assigns(:piece)
  end
end
