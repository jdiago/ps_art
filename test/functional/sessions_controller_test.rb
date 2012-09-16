require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    jo = users(:one)
    post :create, name: jo.name, password: 'password'
    assert_redirected_to '/'
    assert_equal jo.id, session[:user_id]
  end

  test "should fail login" do
    jo = users(:one)
    post :create, name: jo.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_nil session[:user_id]
    assert_redirected_to '/'
  end
end
