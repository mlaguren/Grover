module Grover
  class DataConfig
    
    TYPES = ['s3','db']
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
        
        setup = YAML.load_file(@location)
       
        # Check configuration types for source files
        if ( (TYPES.include?(setup['SourceA']['type'])) && (TYPES.include?(setup['SourceB']['type'])) ) == false
            return "Source not supported."
        else
            setup
        end
       
    end
  end
end
