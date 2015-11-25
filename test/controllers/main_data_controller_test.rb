require 'test_helper'

class MainDataControllerTest < ActionController::TestCase
  setup do
    @main_datum = main_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_datum" do
    assert_difference('MainDatum.count') do
      post :create, main_datum: { about: @main_datum.about, address: @main_datum.address, telephone: @main_datum.telephone, title: @main_datum.title }
    end

    assert_redirected_to main_datum_path(assigns(:main_datum))
  end

  test "should show main_datum" do
    get :show, id: @main_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_datum
    assert_response :success
  end

  test "should update main_datum" do
    patch :update, id: @main_datum, main_datum: { about: @main_datum.about, address: @main_datum.address, telephone: @main_datum.telephone, title: @main_datum.title }
    assert_redirected_to main_datum_path(assigns(:main_datum))
  end

  test "should destroy main_datum" do
    assert_difference('MainDatum.count', -1) do
      delete :destroy, id: @main_datum
    end

    assert_redirected_to main_data_path
  end
end
