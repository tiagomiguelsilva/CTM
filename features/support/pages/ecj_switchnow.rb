require_relative '../../support/useful_tools/data_for_tests/helpers/helpers.rb'

class ECJ_SwitchNow
    include PageObject
    include DataMagic
    include Verifiers

    page_url "https://energy.comparethemarket.com/energy/v2/appForm"

    section(:personal_details, :id => 'PersonalDetails')
    select_list(:title, :id => 'customerName-title')
    text_field(:first_name, :id => 'customerName-firstName')
    text_field(:last_name, :id => 'customerName-surname')
    select_list(:dob_day, :id => 'dateOfBirth-dateOfBirthDay')
    select_list(:dob_month, :id => 'dateOfBirth-dateOfBirthmonth')
    select_list(:dob_year, :id => 'dateOfBirth-dateOfBirthyear')
    text_field(:daytime_phone, :id => 'daytimePhoneNumber-phoneNumber')
    text_field(:evening_phone, :id => 'eveningPhoneNumber-phoneNumber')
    text_field(:email_address, :id => 'emailAddress-emailAddress')
    select_list(:supply_address, :id => 'supplyAddress-knownAddress')
    text_field(:time_at_supply_address_years, :id => 'addressHistoryTwoPreviousAddresses-timeAtSupplyAddressyearsAtAddress')
    text_field(:time_at_supply_address_months, :id => 'addressHistoryTwoPreviousAddresses-timeAtSupplyAddressmonthsAtAddress')
    text_field(:previous_postcode, :id => 'addressHistoryTwoPreviousAddresses-secondPreviousPostcode')
    button(:find_prev_postcode, :id => 'find-postcode-addressHistoryTwoPreviousAddresses-secondPreviousPostcode')
    checkbox(:prefered_contact, :id => 'partnerPrivacyPreference-communicationTypeEmail')
    #
    text_field(:bank_sort1, :id => 'directDebitBankAccount-sortCodesort1')
    text_field(:bank_sort2, :id => 'directDebitBankAccount-sortCodesort2')
    text_field(:bank_sort3, :id => 'directDebitBankAccount-sortCodesort3')
    text_field(:acc_number, :id => 'directDebitBankAccount-accountNumber')
    text_field(:account_holder_name, :id => 'directDebitBankAccount-accountHolderName')

    text_field(:gas_meter, :id => 'gasMeterDetails-meterNumber')
    select_list(:gas_smart_meter, :id => 'gasSmartMeter-hasGasSmartMeter')
    select_list(:electricity_smart_meter, :id => 'electricitySmartMeter-hasElectricitySmartMeter')

    div(:bank_error, :css => '#container_directDebitBankAccount_accountNumber .answer div.error')

    button(:submit, :id => 'appFormSubmit')

    def is_on_page
        wait_until(20,'not on the expected page') {
            @browser.url === 'https://energy.comparethemarket.com/energy/v2/appForm'
        }
    end

    def fill_data_for(field, data_index)
        DataMagic.load "data_type_#{data_index}.yml"
        populate_page_with data_for field
        submit_element.click
    end

    def verify_bank_acc_error
        msg = 'The sort code and account number combination are invalid or your account does not allow direct debit'
        wait_until(20,'expected bank error was not found in time') {
            bank_error_element.text === msg
        }
    end

end
