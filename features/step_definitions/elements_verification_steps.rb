#loading popup | detailed popup | personal details
And (/^I wait for the (.*?) to (appear|disappear)$/) do |field, state|
    case field
    when 'detailed popup'
        on_page(ECJ_YourResults).exists_n_visible(on_page(ECJ_YourResults).detailed_popup_element, state)
    when 'loading popup'
        on_page(ECJ_YourResults).exists_n_visible(on_page(ECJ_YourResults).loading_popup_element, state)
    when 'personal details'
        on_page(ECJ_SwitchNow).exists_n_visible(on_page(ECJ_SwitchNow).personal_details_element, state)
    else
        raise 'not a valid option'
    end
end
