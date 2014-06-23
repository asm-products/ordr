require 'test_helper'

class AppliesControllerTest < ActionController::TestCase
  setup do
    @apply = applies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apply" do
    assert_difference('Apply.count') do
      post :create, apply: { notes: @apply.notes, sent: @apply.sent }
    end

    assert_redirected_to apply_path(assigns(:apply))
  end

  test "should show apply" do
    get :show, id: @apply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apply
    assert_response :success
  end

  test "should update apply" do
    patch :update, id: @apply, apply: { notes: @apply.notes, sent: @apply.sent }
    assert_redirected_to apply_path(assigns(:apply))
  end

  test "should destroy apply" do
    assert_difference('Apply.count', -1) do
      delete :destroy, id: @apply
    end

    assert_redirected_to applies_path
  end
end
