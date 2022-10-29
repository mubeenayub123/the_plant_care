require "test_helper"

class IrrigationSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @irrigation_system = irrigation_systems(:one)
  end

  test "should get index" do
    get irrigation_systems_url
    assert_response :success
  end

  test "should get new" do
    get new_irrigation_system_url
    assert_response :success
  end

  test "should create irrigation_system" do
    assert_difference("IrrigationSystem.count") do
      post irrigation_systems_url, params: { irrigation_system: { uuid: @irrigation_system.uuid } }
    end

    assert_redirected_to irrigation_system_url(IrrigationSystem.last)
  end

  test "should show irrigation_system" do
    get irrigation_system_url(@irrigation_system)
    assert_response :success
  end

  test "should get edit" do
    get edit_irrigation_system_url(@irrigation_system)
    assert_response :success
  end

  test "should update irrigation_system" do
    patch irrigation_system_url(@irrigation_system), params: { irrigation_system: { uuid: @irrigation_system.uuid } }
    assert_redirected_to irrigation_system_url(@irrigation_system)
  end

  test "should destroy irrigation_system" do
    assert_difference("IrrigationSystem.count", -1) do
      delete irrigation_system_url(@irrigation_system)
    end

    assert_redirected_to irrigation_systems_url
  end
end
