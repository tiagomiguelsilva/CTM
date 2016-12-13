Then (/^I fill the page (.*?) with my data (\d+)$/) do |page, data_index|
    case page
    when 'Supplier'
        on_page(ECJ_YourSupplier).fill_data_for(:your_supplier, data_index)
    when 'Energy'
        on_page(ECJ_YourEnergy).fill_data_for(:your_energy, data_index)
    when 'Details'
        on_page(ECJ_YourDetails).fill_data_for(:your_details, data_index)
    when 'Results'
        on_page(ECJ_YourResults).fill_data_for(:your_results, data_index)
    when 'SwitchNow'
        on_page(ECJ_SwitchNow).fill_data_for(:switch_now, data_index)
    else
      raise 'not a valid option'
    end
end
