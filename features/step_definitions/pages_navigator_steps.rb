Given (/^I am at the Energy Comparison Journey$/) do
    visit_page(ECJ_YourSupplier)
    on_page(ECJ_YourSupplier).is_on_page
end

Then (/^I should be at the (.*?) page$/) do |page|
    case page
    when 'Supplier'
        on_page(ECJ_YourSupplier).is_on_page
    when 'Energy'
        on_page(ECJ_YourEnergy).is_on_page
    when 'Details'
        on_page(ECJ_YourDetails).is_on_page
    when 'Results'
        on_page(ECJ_YourResults).is_on_page
    when 'SwitchNow'
        on_page(ECJ_SwitchNow).is_on_page
    else
      raise 'not a valid option'
    end
end

And (/^I save the (.*?) cookie$/) do |page|
    page = page.downcase
    on_page(ECJ_YourResults).save_cookie(page)
end

When (/^I am at the (.*?) page$/) do |page|
    YamlLoader.load_page_cookie(page).each do |each_cookie|
        name = each_cookie[:name]
        value = each_cookie[:value]
        @browser.cookies.add(name,value,each_cookie)
    end

    case page
    when 'Details'
        visit_page(ECJ_YourDetails)
    when 'Results'
        visit_page(ECJ_YourResults)
    else
        raise 'option not available'
    end

end
