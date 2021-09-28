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
      json_data = JSON.parse(@file_data)
      input_data = JSON.parse(input_data).merge("id": generate_id)
      json_data << input_data
      
      File.open("store.json","w") do |f|
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

    def payload
      @key.each_with_index do |val, i|
        "{#{val}: #{@values}}"
      end
    end
    
    def generate_id
      Random.new.bytes(8).bytes.join[0,8]
    end
  end  
end