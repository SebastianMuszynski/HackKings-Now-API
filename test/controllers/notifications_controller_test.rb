require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  setup do
    @notification = notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifications)
  end

  test "should create notification" do
    assert_difference('Notification.count') do
      post :create, notification: { description: @notification.description, event_id: @notification.event_id, name: @notification.name }
    end

    assert_response 201
  end

  test "should show notification" do
    get :show, id: @notification
    assert_response :success
  end

  test "should update notification" do
    put :update, id: @notification, notification: { description: @notification.description, event_id: @notification.event_id, name: @notification.name }
    assert_response 204
  end

  test "should destroy notification" do
    assert_difference('Notification.count', -1) do
      delete :destroy, id: @notification
    end

    assert_response 204
  end
end
