require 'optparse'

module NosqlDb
  class CommandHandler

    attr_accessor :command

    def initialize
      @command = ARGV.first
    end

    def handle
      case @command
      when '--help',nil
        help
      when 'insert'
        insert_record = NosqlDb::Insert.new()
        insert_record.save(ARGV.last)
      when 'delete'
        insert_record = NosqlDb::Delete.new(ARGV.last)
        insert_record.find_and_delete
      else
        puts "wrong command, please try again"
      end
    end

    def help
      print "Below are the commands supported.\n"
      print "\s\sinsert\s\s - insert new record, eg: nosqldb insert {'ab': 2}\n"
      print "\s\sdelete\s\s - delete a record, nosqldb delete {'ab': 2}\n"
      print "\s\sfind\s\s\s\s - find a record base on key, nosqldb find_all {'ab': 2}\n"
      print "\s\sfind_all - find all record base on key, nosqldb find_all {'ab': 2}\n"
      print "\s\s--help - to see all the available commands\n"
    end
  end
end
