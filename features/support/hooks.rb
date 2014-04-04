DatabaseCleaner.add_cleaner(:active_record,:connection => UserDB).strategy = :truncation

Before do |_|
  DatabaseCleaner.clean
end