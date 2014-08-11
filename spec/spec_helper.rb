require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  RSpec.configure do |config|
    Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.around(:each) do |example|
      DatabaseCleaner.cleaning do
        example.run
      end
    end

    config.order = "random"
    config.include Capybara::DSL
  end
end

Spork.each_run do

  #Подгружаем каждый раз все файлы из директории app/
  Dir["#{Rails.root}/app/**/*.rb"].each {|file| load file }
  #Подгружаем файл с описанием маршрутизации
  load "#{Rails.root}/config/routes.rb"

end


