When /^I get "([^\"]*)" notifications$/ do |publisher|
  @publisher = @gnap.publisher(publisher)
  @publisher.should_receive(:get).
             with("/gnip/publishers/#{publisher}/notification/current.xml").
             and_return(fixture(publisher))
  @notifications = @publisher.notifications
end

Then /^I should be able to get the publisher "([^\"]*)" by name$/ do |publisher|
  @publisher = @gnap.publisher(publisher)
  @publisher.should be_kind_of(Gnap::Publisher)
end

Then /^the number (\d*) notification (\w*) should be "([^\"]*)"$/ do |n, method, value|
  @notifications[n.to_i].send(method).should == value
end

