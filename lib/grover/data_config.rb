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
   
  end
end
