module Grover
  class DataConfig
   def initialize(options = {})
       if options.empty?
           @location = "./configuration/grover.yml"
       else
           @location = options[:location]
       end
   end 
   
   def location
       @location
   end
   
   def read_file
       puts File.extname(@location)
       if  File.extname(@location) != ".yml"
           return "#{@location} file extension is invalid"
       end
   end
   
  end
end
