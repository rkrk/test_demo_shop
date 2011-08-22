require 'test_helper'

class MerchandisesControllerTest < ActionController::TestCase
  setup do
    @merchandise = machandises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_show_merchandise)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchandise" do
    assert_difference('Merchandise.count') do
      post :create, :merchandise => @merchandise.attributes
    end

    assert_redirected_to machandise_path(assigns(:merchandise))
  end

  test "should show merchandise" do
    get :show, :id => @merchandise.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @merchandise.to_param
    assert_response :success
  end

  test "should update merchandise" do
    put :update, :id => @merchandise.to_param, :merchandise => @merchandise.attributes
    assert_redirected_to machandise_path(assigns(:merchandise))
  end

  test "should destroy merchandise" do
    assert_difference('Merchandise.count', -1) do
      delete :destroy, :id => @merchandise.to_param
    end

    assert_redirected_to machandises_path
  end
end
