require "application_system_test_case"

class ContractorsTest < ApplicationSystemTestCase
  setup do
    @contractor = contractors(:one)
  end

  test "visiting the index" do
    visit contractors_url
    assert_selector "h1", text: "Contractors"
  end

  test "creating a Contractor" do
    visit contractors_url
    click_on "New Contractor"

    fill_in "Cv", with: @contractor.cv
    fill_in "Name", with: @contractor.name
    fill_in "Rate", with: @contractor.rate
    click_on "Create Contractor"

    assert_text "Contractor was successfully created"
    click_on "Back"
  end

  test "updating a Contractor" do
    visit contractors_url
    click_on "Edit", match: :first

    fill_in "Cv", with: @contractor.cv
    fill_in "Name", with: @contractor.name
    fill_in "Rate", with: @contractor.rate
    click_on "Update Contractor"

    assert_text "Contractor was successfully updated"
    click_on "Back"
  end

  test "destroying a Contractor" do
    visit contractors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contractor was successfully destroyed"
  end
end