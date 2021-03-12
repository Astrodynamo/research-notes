ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

set :environment, ENV['SINATRA_ENV'].to_sym

database_config = {
    :development => {
        :adapter => "sqlite3",
        :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
    }
}

set :database, database_config

#### original env not working, no idea why. blindly copied actions from mixshare video. resources on linking up environment?? << blog
#ActiveRecord::Base.establish_connection(
#    :adapter => "sqlite3"
#    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
#)

require_all 'app' 