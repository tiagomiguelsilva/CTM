require 'capybara'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'rubygems'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'time'
require 'pry'
require 'rspec'
require_relative 'useful_tools/yaml_loader'

Before do
    DataMagic.yml_directory = File.expand_path(File.dirname(File.dirname(__FILE__)))+'/support/useful_tools/data_for_tests'
    PageObject.javascript_framework = :jquery
end

World(PageObject::PageFactory)
