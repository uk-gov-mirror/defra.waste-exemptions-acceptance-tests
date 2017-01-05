Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load

end

Given(/^I am an internal user$/) do

  @app = App.new
  @app.back_office_home_page.load

end

Given(/^I select a new exemption$/) do

  @app.registration_type_page.submit_new

end

When(/^I register an exemption$/) do

  @app.organisation_name_page.submit(
    org_name: "Mr Test"
  )

  @app.address_page.submit_address(
    postcode: "BS1 5AH",
    result: "ENVIRONMENT AGENCY, HORIZON HOUSE, DEANERY ROAD, BRISTOL, BS1 5AH"
  )

  @app.correspondence_contact_page.submit(
    tel_number: "01234567899"
  )

  @app.farm_questions_page.submit

  @app.site_location_page.submit_grid_ref(
    grid_ref: "ST5820572708",
    site_details: "by a tree near a river there's a hole in the ground"
  )

  @app.choose_exemptions_page.submit(
    tab: :using_waste,
    exemption: "U1"
  )

  @app.check_details_page.submit
  @app.declaration_page.submit

end

Then(/^I will be informed the registration is complete$/) do

  expect(page).to have_content "Registration complete"

end