# temporary fix (couldn't yet have made DatabaseCleaner work with Userstamp)
module UserstampDisabler
  def stamper=(object)
    nil
  end
end
User.send(:extend, UserstampDisabler)


def suppress_database_cleaner?
  example.metadata[:js] || example.metadata[:avoid_database_cleaner_transactions]
end

RSpec.configure do |config|
  STRATAGEM = [:transaction]

  config.before(:suite) do
    DatabaseCleaner.clean_with(*STRATAGEM)
    DatabaseCleaner.strategy = *STRATAGEM
  end

  config.before(:each) do
    DatabaseCleaner.start unless suppress_database_cleaner?
  end

  config.after(:each) do
    DatabaseCleaner.clean unless suppress_database_cleaner?
  end

end
