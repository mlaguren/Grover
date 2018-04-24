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
      
  end
end