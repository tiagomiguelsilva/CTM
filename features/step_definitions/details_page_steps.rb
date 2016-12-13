And (/^I enter an invalid email$/) do
    on_page(ECJ_YourDetails).exists_n_visible(on_page(ECJ_YourDetails).email_element, 'appear')
    on_page(ECJ_YourDetails).email_element.value = 'the_invalid_email'
end

And (/^I verify the existence of the email error$/) do
    on_page(ECJ_YourDetails).exists_n_visible(on_page(ECJ_YourDetails).email_error_element, 'appear')
    unless on_page(ECJ_YourDetails).email_error_element.text === 'Your email doesn’t appear to be valid. please check you have entered it correctly.'
        raise 'The email error message was not the expected'
    end
end

Then (/^I click the submit button$/) do
    on_page(ECJ_YourDetails).email_submit_element.click
end
