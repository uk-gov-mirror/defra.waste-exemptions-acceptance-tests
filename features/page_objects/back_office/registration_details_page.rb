# frozen_string_literal: true

require_relative "sections/admin_menu_section"

class RegistrationDetailsPage < SitePrism::Page

  section(:admin_menu_section, AdminMenuSection, AdminMenuSection::SELECTOR)

  element(:back_link, ".link-back")
  element(:heading, ".heading-large")
  element(:content, "#content")

  element(:action_box, ".action-boxout")
  element(:deregister_reg_link, ".separated a")
  elements(:active_tags, ".status-tag-active")
  elements(:ceased_tags, ".status-tag-ceased")
  elements(:revoked_tags, ".status-tag-revoked")
  elements(:deregister_ex_links, ".deregister-exemption-button")
  element(:reporting_info_link, ".govuk-details__summary-text")

  def resend_renewal_letter(registration_number)
    find(:css, "[href='/resend-renewal-letter/#{registration_number}']")
  end

  def resend_confirmation_letter(registration_number)
    find(:css, "[href='/resend-confirmation-letter/#{registration_number}']")
  end

  def resend_confirmation_email(registration_number)
    find(:css, "[href='/resend-confirmation-email/#{registration_number}']")
  end

end
