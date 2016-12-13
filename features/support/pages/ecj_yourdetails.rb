require_relative '../../support/useful_tools/data_for_tests/helpers/helpers.rb'

class ECJ_YourDetails
    include PageObject
    include DataMagic
    include Verifiers

    page_url "https://energy.comparethemarket.com/energy/v2/yourDetails?AFFCLIE=TST"

    label(:pre_select_fixed, :class => 'fixed-rate')
    label(:pre_select_payment_monthly, :class => 'payment-monthly')
    label(:terms, :id => 'terms-label')
    text_field(:email, :id => 'Email')
    div(:email_error, :css => '#email div.error')
    button(:email_submit, :id => 'email-submit')

    def is_on_page
        wait_until(20,'not on the expected page') {
            @browser.url === 'https://energy.comparethemarket.com/energy/v2/yourDetails?AFFCLIE=TST'
        }
    end

    def fill_data_for(field, data_index)
        DataMagic.load "data_type_#{data_index}.yml"
        pre_select_fixed_element.click
        pre_select_payment_monthly_element.click
        email_element.send_keys "something#{rand(999999)}@maildrop.cc"
        terms_element.click
        email_submit_element.click
        wait_for_ajax
    end

end
