require "nosql_db/version"
require "nosql_db/command_handler"
require "nosql_db/insert"
require "nosql_db/delete"
require "nosql_db/find"

module NosqlDb
  class Error < StandardError; end
end
