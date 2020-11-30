require 'test_helper'

class HealthConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_condition = health_conditions(:one)
  end

  test "should get index" do
    get health_conditions_url, as: :json
    assert_response :success
  end

  test "should create health_condition" do
    assert_difference('HealthCondition.count') do
      post health_conditions_url, params: { health_condition: { name: @health_condition.name, priority: @health_condition.priority } }, as: :json
    end

    assert_response 201
  end

  test "should show health_condition" do
    get health_condition_url(@health_condition), as: :json
    assert_response :success
  end

  test "should update health_condition" do
    patch health_condition_url(@health_condition), params: { health_condition: { name: @health_condition.name, priority: @health_condition.priority } }, as: :json
    assert_response 200
  end

  test "should destroy health_condition" do
    assert_difference('HealthCondition.count', -1) do
      delete health_condition_url(@health_condition), as: :json
    end

    assert_response 204
  end
end
