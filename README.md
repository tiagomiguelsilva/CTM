# Install and make sure you are using Ruby version 2.2.2
# Firefox installed in the machine is also a requirement for these quick tests
# Description:

# Runner:
# on the root:
# 	* Run all:
# bundle exec cucumber -r features/
# 	* Run specific scenarios:
# bundle exec cucumber -t @invalid_bank_account
# bundle exec cucumber -t @invalid_email
# bundle exec cucumber -t @results_in_descending_order

# 'make' on the root of the project
# with the version 2.2.2 of ruby installed
# as well as firefox 38 - 48
# There's a known issue with geckodriver
# for firefox 48+ ...
