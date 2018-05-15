##
# This class represents the basic comparisons done on two tabular data sources

module Grover
    class BasicComparisons
        ##
        # Creates a basic comparison object on the two tabular data sets
        def initialize(source_a, source_b, options = {})
            @source_a = JSON.parse(File.read(source_a))
            @source_b = JSON.parse(File.read(source_b))
            @options = options
        end
        
        ##
        # Checks if the two data sources are the same size (a.k.a. equal number of rows)
        def equal_rows?
            if @source_a.size == @source_b.size
                true
            else 
                false
            end
        end
        
        ##
        # Checks to see if there is data in one source that doesn't exist in the other source and vice versa
        
        def does_not_exists
            [ (@source_a - @source_b), (@source_b - @source_a) ]
        end
        
    end
end
