Given /^I have a gnap connection$/ do
  @gnap = Gnap.new('fakeuser', 'fakepassword')
end

Then /^there should be (\d*) notifications$/ do |n|
  @notifications.size.should == n.to_i
end

