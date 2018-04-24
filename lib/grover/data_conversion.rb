module Grover
  class DataConversion
      
      def initialize(file)
          @file = file
      end
      
      def to_hash
        if File.extname(@file) == '.csv'
        data = []
        CSV.foreach(@file, headers: true) do |row|
          data << row.to_hash
        end
          return data
        end
      end
      
      def to_json_file(epoch)
        Dir.mkdir('tmp') unless File.exists?('tmp')
        Dir.mkdir("tmp/#{epoch.to_s}") unless File.exists?("data/#{epoch.to_s}")
        File.open("tmp/#{epoch.to_s}/#{File.basename(@file, ".*")}.json","w") do |f|
            f.write(JSON.pretty_generate(self.to_hash))
        end
      end
  end
end