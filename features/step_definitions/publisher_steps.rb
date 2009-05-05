Given /^I have a gnap connection$/ do
  @gnap = Gnap.new('fakeuser', 'fakepassword')
end


When /^I get "([^\"]*)" notifications$/ do |publisher|
  @publisher = @gnap.publisher(publisher)
  @publisher.stub!(:get).and_return(fixture('twitter'))
  @notifications = @publisher.notifications
end

Then /^I should be able to get the publisher "([^\"]*)" by name$/ do |publisher|
  @publisher = @gnap.publisher(publisher)
  @publisher.should be_kind_of(Gnap::Publisher)
end



