# require 'rake'
# require 'active_record'
# require 'yaml/store'
# require 'ostruct'
# require 'date'

require 'bundler/setup'
Bundler.require

# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
# )

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/users.sqlite"
)

require_all 'app'