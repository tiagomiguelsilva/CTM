module Verifiers
    require 'yaml'

    def exists_n_visible(element, expectation)
        expectation == 'appear' ?
            wait_until{ element.exists? && element.visible? } :
            wait_until{ element.exists? && !element.visible? }
    end

    def save_cookie(page)
        system("#{page}.yml")
        File.open("#{page}.yml", "w+") { |file| file.write(@browser.browser.cookies.to_a.to_yaml) }
        system("mv #{page}.yml features/support/useful_tools/data_for_tests/pages")
    end

end
