module Grover
  class DataConfig
      
   def initialize(options = {})
       if options.empty?
           @location = "./configuration/grover.yml"
       else
           @location = options[:location]
       end
       
       @template = YAML.load_file("./configuration/grover.yml.template")
   end 
   
   def location
       @location
   end
   
   def set_config
       if  File.extname(@location) != ".yml"
           return "#{@location} file extension is invalid"
       end
       YAML.load_file(@location)
       
   end
   
  end
end
