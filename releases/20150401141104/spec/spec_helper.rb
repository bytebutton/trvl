ENV["RAILS_ENV"] ||= 'test'
require 'rubygems'
require 'spork'
require 'webrat'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Webrat.configure do |config|
  config.mode = :rails
end

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  require 'simplecov'
  require 'timeout'
  SimpleCov.start 'rails'

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  #Capybara.javascript_driver = :webkit
  #Capybara.default_wait_time = 10

  #factories_spec_file = "#{Rails.root}/spec/factories_spec.rb"

  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    #config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = true

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    # config.order = "random"

    config.treat_symbols_as_metadata_keys_with_true_values = true

    config.run_all_when_everything_filtered = true

    config.filter_run :focus => true

    config.filter_run_excluding :slow => true

    config.include Devise::TestHelpers,        :type => :controller
    config.include FactoryGirl::Syntax::Methods
    config.extend ControllerMacros,            :type => :controller

    config.include Devise::TestHelpers, :type => :view
    config.extend ControllerMacros,     :type => :view

    config.include Devise::TestHelpers, :type => :helper
    config.extend ControllerMacros,     :type => :helper

    #config.before(:each) do
    #  # User.system_user expected to be nil on properly initialized database - picking it if it exists for some reason, though
    #  # if system user is created, it's removed by DatabaseCleaner after test run (User.system_user.id will be different in each test)
    #  User.current_user = User.find(93) #User.system_user || FactoryGirl.create(:system_user)
    #end
  end

  #def inspect_response
  #  res = ActiveSupport::JSON.decode(response.body)
  #  puts res
  #  res
  #end

end

Spork.each_run do
  # This code will be run each time you run your specs.
end