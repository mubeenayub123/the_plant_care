require "application_system_test_case"

class ComplaintsTest < ApplicationSystemTestCase
  setup do
    @complaint = complaints(:one)
  end

  test "visiting the index" do
    visit complaints_url
    assert_selector "h1", text: "Complaints"
  end

  test "should create complaint" do
    visit complaints_url
    click_on "New complaint"

    fill_in "Description", with: @complaint.description
    fill_in "Irrigation system", with: @complaint.irrigation_system_id
    fill_in "Status", with: @complaint.status
    fill_in "Title", with: @complaint.title
    fill_in "User", with: @complaint.user_id
    click_on "Create Complaint"

    assert_text "Complaint was successfully created"
    click_on "Back"
  end

  test "should update Complaint" do
    visit complaint_url(@complaint)
    click_on "Edit this complaint", match: :first

    fill_in "Description", with: @complaint.description
    fill_in "Irrigation system", with: @complaint.irrigation_system_id
    fill_in "Status", with: @complaint.status
    fill_in "Title", with: @complaint.title
    fill_in "User", with: @complaint.user_id
    click_on "Update Complaint"

    assert_text "Complaint was successfully updated"
    click_on "Back"
  end

  test "should destroy Complaint" do
    visit complaint_url(@complaint)
    click_on "Destroy this complaint", match: :first

    assert_text "Complaint was successfully destroyed"
  end
end
