module Grover
  class DataInit
  
  def initialize(configuration)
    @epoch = Time.now.to_i
    @configuration = YAML.load_file(configuration)
  end
  
 
  def epoch
   #   @epoch
  end
  
  def setup
      Dir.mkdir('data') unless File.exists?('data')
      Dir.mkdir("data/#{@epoch.to_s}") unless File.exists?("data/#{@epoch.to_s}")
  end
  
  def download_data(source)
    
    if @configuration[source]['type'] == 'csv'
        
        if File.exists?(@configuration[source]['location']) == false
          return "File is not in given location"
        end
        
       FileUtils.cp(@configuration[source]['location'], "./data/#{@epoch.to_s}/#{source}.csv")
    end
    
    
  end
  
  end
end
