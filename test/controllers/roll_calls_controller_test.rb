require 'test_helper'

class RollCallsControllerTest < ActionController::TestCase
  setup do
    @roll_call = roll_calls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roll_calls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roll_call" do
    assert_difference('RollCall.count') do
      post :create, roll_call: {  }
    end

    assert_redirected_to roll_call_path(assigns(:roll_call))
  end

  test "should show roll_call" do
    get :show, id: @roll_call
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roll_call
    assert_response :success
  end

  test "should update roll_call" do
    patch :update, id: @roll_call, roll_call: {  }
    assert_redirected_to roll_call_path(assigns(:roll_call))
  end

  test "should destroy roll_call" do
    assert_difference('RollCall.count', -1) do
      delete :destroy, id: @roll_call
    end

    assert_redirected_to roll_calls_path
  end
end
