Then (/^I click on the (\d+)(st|nd|rd|th) tariff (.*?)$/) do |index, drop, field|
    case field
    when 'more details'
        on_page(ECJ_YourResults).select_more_details(index)
    else
        raise 'not a valid option'
    end
end

Then (/^I click the "(.*?)" button$/) do |option|
    option = option.downcase
    case option
    when 'switch now'
        on_page(ECJ_YourResults).detailed_popup_section.switch_now_element.click
    else
        raise 'not a valid option'
    end
end

Then (/^I check the prices to be in (ascending|descending) order$/) do |order|
    on_page(ECJ_YourResults).prices_order(order)
end
