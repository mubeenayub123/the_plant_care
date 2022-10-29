require "application_system_test_case"

class IrrigationSystemsTest < ApplicationSystemTestCase
  setup do
    @irrigation_system = irrigation_systems(:one)
  end

  test "visiting the index" do
    visit irrigation_systems_url
    assert_selector "h1", text: "Irrigation systems"
  end

  test "should create irrigation system" do
    visit irrigation_systems_url
    click_on "New irrigation system"

    fill_in "Uuid", with: @irrigation_system.uuid
    click_on "Create Irrigation system"

    assert_text "Irrigation system was successfully created"
    click_on "Back"
  end

  test "should update Irrigation system" do
    visit irrigation_system_url(@irrigation_system)
    click_on "Edit this irrigation system", match: :first

    fill_in "Uuid", with: @irrigation_system.uuid
    click_on "Update Irrigation system"

    assert_text "Irrigation system was successfully updated"
    click_on "Back"
  end

  test "should destroy Irrigation system" do
    visit irrigation_system_url(@irrigation_system)
    click_on "Destroy this irrigation system", match: :first

    assert_text "Irrigation system was successfully destroyed"
  end
end
