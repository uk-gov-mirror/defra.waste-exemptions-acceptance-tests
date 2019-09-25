# frozen_string_literal: true

class AddressLookupPage < SitePrism::Page

  # This is a generic page object file for contact and operator address, to prevent repetition.
  # Although the page objects have different identifiers, they follow the same pattern
  # and so each field can be identified through what its id contains.

  element(:error, ".error-summary")
  element(:heading, ".heading-large")

  # Postcode forms on individual screens are as follows, as from Sep '19:
  # #operator_postcode_form_temp_operator_postcode
  # #contact_postcode_form_temp_contact_postcode
  # #site_postcode_form_temp_site_postcode
  element(:postcode, "input[id*='postcode_form_temp']")
  element(:find_address, "input[value='Find address']")

  # Search results as a dropdown
  element(:show_list, "input[id='address_match_selection']")
  element(:results_dropdown, "select[id*='address_lookup_form_temp_address']")
  element(:cannot_find_address, "a[href*='address-lookup/skip']")

  element(:submit_button, ".button")

  def submit(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click
    results_dropdown.select(args[:result]) if args.key?(:result)
    submit_button.click
  end

  def choose_manual_address(args = {})
    postcode.set(args[:postcode]) if args.key?(:postcode)
    find_address.click
    cannot_find_address.click
  end

end