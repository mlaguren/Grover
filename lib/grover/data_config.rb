module Grover
  class DataConfig
      
    ##
    # This class represents the configuration object in Grover.

    # Supported types of grover (currently csv has been implemented)
    TYPES = ['csv','s3','db']
    
    ##
    # Initialization of the configuration object with either the default location of the configuration or custom location.

    def initialize(options = {})
       if options.empty?
           @location = "./configuration/grover.yml"
       else
           @location = options[:location]
       end
       
       @template = YAML.load_file("./configuration/grover.yml.template")
    end 
    
    ##
    #  Sets the location of the data sources configuration file
    
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
