Compare The Market (CTM)
===

### Setup Ruby:
Install and make sure you are using Ruby version 2.2.2

Install Brew
 ```
 brew install wget
 ```

Install rbenv
 ```
 brew install rbenv ruby-build

 # Add rbenv to bash so that it loads every time you open a terminal
 echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
 source ~/.bash_profile
 ```
 # Install Ruby
  ```
 rbenv install 2.2.2
 rbenv global 2.2.2
  ```
 On the project root if you just want it locally
  ```
 rbenv local 2.2.2
  ```

 Checking Ruby version
  ```
 ruby -v
  ```
Firefox version from 38 to 48 installed in the machine is also a requirement for these quick tests.

- [firefox versions](https://ftp.mozilla.org/pub/firefox/releases/) - Download the version of firefox that you need from here


Cloning the repo:
```
git clone https://github.com/tiagomiguelsilva/CTM.git
```

Installing Gems:
on the project root:
```
gem install bundler
bundle install
```
if needed
```
selenium install
```

#Running tests:
 on the root:
### Run all:
```
 bundle exec cucumber -r features/
```
### Run specific scenarios:
```
 bundle exec cucumber -t @invalid_bank_account
 bundle exec cucumber -t @invalid_email
 bundle exec cucumber -t @results_in_descending_order
```

If Ruby 2.2.2 is already installed appearing as 2.2.2 when we "ruby -v" on the root of the project.
If we also have the expected version of firefox installed.
the following command on the root should run the tests.
```
make
```
