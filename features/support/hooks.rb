require 'watir-webdriver'

Before do
    @browser = Watir::Browser.new :firefox
end

After do
    @browser.close
end

at_exit do
  system("rm -rf features/support/useful_tools/data_for_tests/pages/*")
end
