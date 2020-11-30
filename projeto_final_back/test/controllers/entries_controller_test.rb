require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get entries_url, as: :json
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post entries_url, params: { entry: { arrival_time: @entry.arrival_time, doctor_crm: @entry.doctor_crm, health_condition_id: @entry.health_condition_id, user_cpf: @entry.user_cpf, was_attended: @entry.was_attended } }, as: :json
    end

    assert_response 201
  end

  test "should show entry" do
    get entry_url(@entry), as: :json
    assert_response :success
  end

  test "should update entry" do
    patch entry_url(@entry), params: { entry: { arrival_time: @entry.arrival_time, doctor_crm: @entry.doctor_crm, health_condition_id: @entry.health_condition_id, user_cpf: @entry.user_cpf, was_attended: @entry.was_attended } }, as: :json
    assert_response 200
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry), as: :json
    end

    assert_response 204
  end
end
