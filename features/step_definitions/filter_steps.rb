Given /^I have the "([^\"]*)" publisher$/ do |publisher|
  @publisher = @gnap.publisher(publisher)
end

Then /^I should be able to get the "([^\"]*)" filter$/ do |filter|
  @publisher.filter(filter).should be_kind_of(Gnap::Filter)
end

Then /^I should be able to create filter "([^\"]*)"$/ do |name|
  filter = mock("filter", :to_xml => "xmlxmlxml", :null_object => true)
  Gnap::Filter.stub!(:new).and_return(filter)
  @publisher.should_receive(:post).with("/gnip/publishers/delicious/filters.xml", "xmlxmlxml") 
  @filter = @publisher.create_filter!("foobar", :actor => "bazqux")
end

Then /^add an "([^\"]*)" rule with a value of "([^\"]*)"$/ do |type, value|
  @filter.should_receive(:post).with("/gnip/publishers/#{@publisher}/filters/#{@filter}/rules.xml",
       "<?xml version=\"1.0\" encoding=\"UTF-8\"?><rules><rule type=\"#{type}\">#{value}</rule></rules>")
  @filter.add_rule!(type, value)
end

Then /^I should be able to create filter "([^\"]*)" with a postback rule$/ do |name|
  filter = mock("filter", :to_xml => "xmlxmlxml", :null_object => true)
  Gnap::Filter.stub!(:new).and_return(filter)
  @publisher.should_receive(:post).with("/gnip/publishers/delicious/filters.xml", "xmlxmlxml")
  @filter = @publisher.create_filter!("foobar", :actor => "bazqux", :postURL => "http://some.url/path")
end


Then /^I should be able to update a filter "([^\"]*)"$/ do |name|
  filter = mock("filter", :to_xml => "xmlxmlxml", :null_object => true)
  Gnap::Filter.stub!(:new).and_return(filter)
  @publisher.should_receive(:put).with("/gnip/publishers/delicious/filters/foobar.xml", "xmlxmlxml")
  @filter = @publisher.update_filter!(name, :actor => "bazqux")
end
