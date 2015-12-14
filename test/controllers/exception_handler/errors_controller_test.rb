require 'test_helper'

module ExceptionHandler
  class ErrorsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get not_found" do
      get :not_found
      assert_response :success
    end

    test "should get unauthorized" do
      get :unauthorized
      assert_response :success
    end

    test "should get server_error" do
      get :server_error
      assert_response :success
    end

  end
end
