require_relative '../../support/useful_tools/data_for_tests/helpers/helpers.rb'

class ECJ_YourSupplier
    include PageObject
    include DataMagic
    include Verifiers

    page_url 'https://energy.comparethemarket.com/energy/v2/?AFFCLIE=TST'

    text_field(:post_code, :id => 'your-postcode')
    button(:find_postcode, :id => 'find-postcode')
    button(:change_postcode, :id => 'change-postcode')
    label(:have_bill, :id => 'have-bill')
    label(:no_bill, :id => 'no-bill-label')
    span(:both, :class => 'energy-gas-electricity')
    span(:only_electricity, :class => 'energy-electricity')
    span(:only_gas, :class => 'energy-gas')
    button(:go_to_supplier_details, :id => 'goto-your-supplier-details')

    def is_on_page
        wait_until(20,'not on the expected page') {
            @browser.url === 'https://energy.comparethemarket.com/energy/v2/?AFFCLIE=TST'
        }
    end

    def fill_data_for(field, data_index)
        DataMagic.load "data_type_#{data_index}.yml"
        populate_page_with data_for field
        find_postcode_element.click
        wait_until(10,'post code field didn\'t disappear in time') {
            !post_code_element.visible?
        }
        wait_for_ajax
        go_to_supplier_details_element.when_visible.click
    end

end
