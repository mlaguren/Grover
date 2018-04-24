module Grover
  class DataInit
  
  def initialize(configuration)
    @epoch = Time.now.to_i
    @configuration = YAML.load_file(configuration)
  end
  
 
  def epoch
      @epoch
  end
  
  def setup
      Dir.mkdir('data') unless File.exists?('data')
      Dir.mkdir("data/#{@epoch.to_s}") unless File.exists?("data/#{@epoch.to_s}")
  end
  
  def download_data(source)
    
    if @configuration[source]['type'] == 'csv'
    #   CSV.foreach(@configuration[source]['location'], headers: true) do |row|
   #      hash << row.inspect # hash
 #      end
 #      return hash
    end
    
    
  end
  
  end
end