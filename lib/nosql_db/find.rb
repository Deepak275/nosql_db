require 'json'

module NosqlDb
  class Find
    attr_accessor :matched_records, :value

    def initialize(value)
      @file_data = File.read("store.json")
      @value = value
    end

    def search
      @matched_records = []
      sleep_if_writting
      
      json_store = JSON.parse(@file_data)

      json_store.each do |stringified_hash|
        hash = eval(stringified_hash)
        hash.each do |k, v|
          v = v.to_s
          if v == @value
            @matched_records << hash
            break
          end  
        end
      end
      puts "Matched: records: #{(matched_records)}"
    end

    private

    def sleep_if_writting
      unless check_write_done?
        puts "Write is going on, waiting for it to finish"
        sleep(0.01)
      end
    end

    def check_write_done?
      !Insert.new.insert_done?
    end
  end
end