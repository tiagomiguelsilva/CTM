And (/^I see the error for not having a valid bank account$/) do
    on_page(ECJ_SwitchNow).verify_bank_acc_error
end
