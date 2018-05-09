Feature:  As a user, I would like to use Grover to compare to files
  
  Scenario:  Basic Comparison
    Given I have two csv files
    When I execute grover
    Then I should get a report of the differences