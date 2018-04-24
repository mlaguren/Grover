module Grover
    class BasicComparisons
        
        def initialize(source_a, source_b, options = {})
            @source_a = JSON.parse(File.read(source_a))
            @source_b = JSON.parse(File.read(source_b))
            @options = options
        end
        
        def equal_rows?
            if @source_a.size == @source_b.size
                true
            else 
                false
            end
        end
        
    end
end
