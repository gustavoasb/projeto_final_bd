require 'test_helper'

class EntryHasSymptomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_has_symptom = entry_has_symptoms(:one)
  end

  test "should get index" do
    get entry_has_symptoms_url, as: :json
    assert_response :success
  end

  test "should create entry_has_symptom" do
    assert_difference('EntryHasSymptom.count') do
      post entry_has_symptoms_url, params: { entry_has_symptom: { entry_id: @entry_has_symptom.entry_id, symptom_id: @entry_has_symptom.symptom_id } }, as: :json
    end

    assert_response 201
  end

  test "should show entry_has_symptom" do
    get entry_has_symptom_url(@entry_has_symptom), as: :json
    assert_response :success
  end

  test "should update entry_has_symptom" do
    patch entry_has_symptom_url(@entry_has_symptom), params: { entry_has_symptom: { entry_id: @entry_has_symptom.entry_id, symptom_id: @entry_has_symptom.symptom_id } }, as: :json
    assert_response 200
  end

  test "should destroy entry_has_symptom" do
    assert_difference('EntryHasSymptom.count', -1) do
      delete entry_has_symptom_url(@entry_has_symptom), as: :json
    end

    assert_response 204
  end
end
