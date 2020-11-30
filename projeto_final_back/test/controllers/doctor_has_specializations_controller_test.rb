require 'test_helper'

class DoctorHasSpecializationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor_has_specialization = doctor_has_specializations(:one)
  end

  test "should get index" do
    get doctor_has_specializations_url, as: :json
    assert_response :success
  end

  test "should create doctor_has_specialization" do
    assert_difference('DoctorHasSpecialization.count') do
      post doctor_has_specializations_url, params: { doctor_has_specialization: { doctor_crm: @doctor_has_specialization.doctor_crm, specialization_id: @doctor_has_specialization.specialization_id } }, as: :json
    end

    assert_response 201
  end

  test "should show doctor_has_specialization" do
    get doctor_has_specialization_url(@doctor_has_specialization), as: :json
    assert_response :success
  end

  test "should update doctor_has_specialization" do
    patch doctor_has_specialization_url(@doctor_has_specialization), params: { doctor_has_specialization: { doctor_crm: @doctor_has_specialization.doctor_crm, specialization_id: @doctor_has_specialization.specialization_id } }, as: :json
    assert_response 200
  end

  test "should destroy doctor_has_specialization" do
    assert_difference('DoctorHasSpecialization.count', -1) do
      delete doctor_has_specialization_url(@doctor_has_specialization), as: :json
    end

    assert_response 204
  end
end
