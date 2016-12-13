require_relative 'sections/your_details/ecj_section_detailedpopup'
require_relative '../../support/useful_tools/data_for_tests/helpers/helpers.rb'

class ECJ_YourResults
    include PageObject
    include DataMagic
    include Verifiers

    page_url "https://energy.comparethemarket.com/energy/Results/YourResults"

    div(:loading_popup, :class => 'price-page-interstitial')
    page_section(:detailed_popup_section, DetailedPopup, :class => 'bridging-page')
    div(:detailed_popup, :class => 'bridging-page')
    spans(:prices, :css => '.price span[data-bind="text: AnnualSavings"]')
    spans(:supplier_names, :css => '.supplier-column .name-of-tariff span')
    links(:more_details, :css => '#price-page-results-view a.button-primary[name="details-button"]')

    def is_on_page
      wait_until(20,'not on the expected page') {
          @browser.url === 'https://energy.comparethemarket.com/energy/Results/YourResults'
      }
    end

    def prices_order(order)
      case order
      when 'ascending'
          for i in 1..prices_elements.count-1
              if prices_elements[i-1].text.to_i <= prices_elements[i].text.to_i
                  raise "the prices on the indexes #{i-1} and #{i} are wrong"
              end
          end
      when 'descending'
          for i in 1..prices_elements.count-1
              return true if (i != 1 && prices_elements[i-1].text === "")
              puts "#{prices_elements[i-1].text} >= #{prices_elements[i].text}"
              unless prices_elements[i-1].text.to_i >= prices_elements[i].text.to_i
                  raise "the prices on the indexes #{i-1} and #{i} are wrong"
              end
          end
      else
          raise 'invalid option'
      end
    end

    def select_more_details(index)
      more_details_elements[index.to_i-1].click
    end

end
