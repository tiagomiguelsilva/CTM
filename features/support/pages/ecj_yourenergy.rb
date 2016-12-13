require_relative '../../support/useful_tools/data_for_tests/helpers/helpers.rb'

class ECJ_YourEnergy
    include PageObject
    include DataMagic
    include Verifiers

    page_url "https://energy.comparethemarket.com/energy/v2/yourEnergyNoBill?AFFCLIE=TST"

    radio_button(:prepayment_meter, :id => 'prepayment-yes')
    radio_button(:economy_7_yes, :id => 'economy-7-yes')
    text_field(:electricity_current_spent, :id => 'electricity-current-spend')
    select_list(:electricity_current_spent_period, :id => 'electricity-current-spend-period')
    checkbox(:current_electricity_cb, :id => 'electricity-dont-know')
    text_field(:gas_current_spent, :id => 'gas-current-spend')
    select_list(:gas_current_spent_period, :id => 'gas-current-spend-period')
    checkbox(:current_gas_cb, :id => 'gas-dont-know')
    text_field(:electricity_usage_amount, :id => 'electricity-usage')
    text_field(:gas_usage_amount, :id => 'gas-usage')
    button(:go_back, :id => 'go-back')
    button(:go_to_your_energy, :id => 'goto-your-energy')

    def is_on_page
        wait_until(20,'not on the expected page') {
            @browser.url === 'https://energy.comparethemarket.com/energy/v2/yourEnergy?AFFCLIE=TST'
        }
    end

    def fill_data_for(field, data_index)
        DataMagic.load "data_type_#{data_index}.yml"
        wait_until(60,'page was not completely loaded in time') {
            go_to_your_energy_element.exists? && go_to_your_energy_element.visible?
        }
        populate_page_with data_for field
        go_to_your_energy_element.when_visible.click
        wait_for_ajax
        populate_page_with data_for field
        go_to_your_energy_element.when_visible.click
        wait_for_ajax
    end

end
