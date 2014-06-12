require 'capybara/rspec'
require 'capybara/webkit'

Capybara.run_server = false
Capybara.default_driver = :webkit
Capybara.app_host = 
  'http://127.0.0.1:5984/tire-a-part/_design/tire-a-part/_rewrite'

def test_count(element, count) 
  page.all("#{element}").count.should eql(count)
end
