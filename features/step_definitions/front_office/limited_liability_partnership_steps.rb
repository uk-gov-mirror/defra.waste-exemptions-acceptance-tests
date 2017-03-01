Given(/^I am a limited liability partnership$/) do

  # Contact details page
  @app.contact_details_page.submit(
    full_name: "John Smith",
    tel_number: "01234567899",
    email: "tim.stone.ea@gmail.com",
    confirm_email: "tim.stone.ea@gmail.com"
  )
  @app.user_type_page.submit(
    org_type: "WasteExemptionsShared::OrganisationType::LimitedLiabilityPartnership"
  )

  @app.company_number_page.submit(
    company_number: "12345678"
  )

  @app.company_name_page.submit(
    company_name: "Testing LLP"
  )
end