require 'bundler'
Bundler.require
require_relative "../app/models/pokemon"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/pokemon.db')

#require_all 'app'
