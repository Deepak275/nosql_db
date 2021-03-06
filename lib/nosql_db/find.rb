require 'json'

module NosqlDb
  class Find
    attr_accessor :matched_records, :value, :fields

    def initialize(value, fields = nil)
      @file_data = File.read("store.json")
      @value = value
      @fields = fields.split(',') unless fields.nil?
    end

    def search
      @matched_records = []
      
      json_store = JSON.parse(@file_data)

      json_store.each do |hash|
        hash.each do |k, v|
          v = v.to_s
          if v == @value
            @matched_records << hash
            break
          end  
        end
      end

      print_results
    end

    private
    
    def print_results
      results = []

      if @fields.nil?
        results = @matched_records
      else
        @matched_records.each do |hash|
          results << hash.slice(*@fields)
        end
      end

      puts "Matched: records -"
      results.each do |hash|
        puts "\s\sRecord: fields: #{hash.keys.join(',')}, values: #{hash.values.join(' ')}"
      end
    end
  end
end