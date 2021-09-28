require 'json'

module NosqlDb
  class Delete

    attr_accessor :file_data, :key, :value

    def initialize(input)
      @file_data = File.read("store.json")
      @key, @value = *(input.split(','))
    end


    def find_and_delete
      sleep_if_writting
      
      json_store = JSON.parse(@file_data)

      json_store.each do |hash|
        hash.each do |k, v|
          k = k.to_s
          v = v.to_s

          if v == @value && k == @key
            json_store.delete(hash)
            break
          end  
        end
      end

      File.open("store.json","w") do |f|
        f.puts json_store.to_json
      end
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