require 'rspec'
require 'train'
require 'pg'

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM train_line *;")
    DB.exec("DELETE FROM train_station *;")
  end
end
