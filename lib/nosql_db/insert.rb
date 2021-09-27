require 'json'

module NosqlDb
  class Insert

    @@insert_done = false
    attr_accessor :input, :file

    def initialize
      @file_data = File.read("store.json")
      insert_runnning!
      
    end

    def save(input_data)
      p json_data = JSON.parse(@file_data)
      json_data << input_data

      File.open("store.json","w") do |f|
        # f.puts json_data.to_json
        f.puts JSON.pretty_generate(json_data)
      end

      insert_done!
    end

    def insert_done?
      @@insert_done
    end

    def insert_runnning!
      @@insert_done = false
    end

    def insert_done!
      @@insert_done = true
    end
  end  
end