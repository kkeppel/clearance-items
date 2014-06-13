# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] = 'development'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect, :should_receive]
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :should
  end

  config.infer_spec_type_from_file_location!
end
