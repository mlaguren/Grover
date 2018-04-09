class Readme
  def initialize
      @file = File.open("./README.md")
  end
  
  def there
      File.exists?(@file)
  end
  
  
end