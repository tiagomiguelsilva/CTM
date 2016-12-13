Feature: Testing Energy Comparison Journey(ECJ)💰

    Background:
        Given I am at the Energy Comparison Journey

# This was supposed to be the success case, but
# since I am missing bank account details
# I managed to just check the error message
# for invalid bank account

    @invalid_bank_account
    Scenario: Testing the ECJ with success data
        Then I should be at the Supplier page
        Then I fill the page Supplier with my data 1
        Then I should be at the Energy page
        Then I fill the page Energy with my data 1
        Then I should be at the Details page
        And I save the Details cookie
        Then I fill the page Details with my data 1
        Then I should be at the Results page
        And I save the Results cookie
        And I wait for the loading popup to appear
        And I wait for the loading popup to disappear
        Then I click on the 3rd tariff more details
        And I wait for the detailed popup to appear
        Then I click the "Switch now" button
        Then I should be at the SwitchNow page
        And I wait for the personal details to appear
        Then I fill the page SwitchNow with my data 1
        And I see the error for not having a valid bank account

    @invalid_email
    Scenario: Invalid Email on Details page
        When I am at the Details page
        And I enter an invalid email
        Then I click the submit button
        And I verify the existence of the email error

        # This scenario is just an example for going to
        # the Results page and verify the order of the
        # Results

    @results_in_descending_order
    Scenario: Testing the Results page descending order
        When I am at the Results page
        Then I check the prices to be in descending order
