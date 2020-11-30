require 'test_helper'

class TelephonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telephone = telephones(:one)
  end

  test "should get index" do
    get telephones_url, as: :json
    assert_response :success
  end

  test "should create telephone" do
    assert_difference('Telephone.count') do
      post telephones_url, params: { telephone: { cell_phone: @telephone.cell_phone, home_phone: @telephone.home_phone } }, as: :json
    end

    assert_response 201
  end

  test "should show telephone" do
    get telephone_url(@telephone), as: :json
    assert_response :success
  end

  test "should update telephone" do
    patch telephone_url(@telephone), params: { telephone: { cell_phone: @telephone.cell_phone, home_phone: @telephone.home_phone } }, as: :json
    assert_response 200
  end

  test "should destroy telephone" do
    assert_difference('Telephone.count', -1) do
      delete telephone_url(@telephone), as: :json
    end

    assert_response 204
  end
end
