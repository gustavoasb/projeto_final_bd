require 'test_helper'

class AttendantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendant = attendants(:one)
  end

  test "should get index" do
    get attendants_url, as: :json
    assert_response :success
  end

  test "should create attendant" do
    assert_difference('Attendant.count') do
      post attendants_url, params: { attendant: { birth_date: @attendant.birth_date, hiring_date: @attendant.hiring_date, name: @attendant.name, unit_id: @attendant.unit_id } }, as: :json
    end

    assert_response 201
  end

  test "should show attendant" do
    get attendant_url(@attendant), as: :json
    assert_response :success
  end

  test "should update attendant" do
    patch attendant_url(@attendant), params: { attendant: { birth_date: @attendant.birth_date, hiring_date: @attendant.hiring_date, name: @attendant.name, unit_id: @attendant.unit_id } }, as: :json
    assert_response 200
  end

  test "should destroy attendant" do
    assert_difference('Attendant.count', -1) do
      delete attendant_url(@attendant), as: :json
    end

    assert_response 204
  end
end
