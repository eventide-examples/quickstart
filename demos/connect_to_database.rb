require_relative '../init'
require 'eventide/postgres'

session = MessageStore::Postgres::Session.build

raise "Already connected" if session.connected?

# Connects on first use
session.execute('SELECT 1;')

raise "Not connected" unless session.connected?

puts "Connected to the database"
