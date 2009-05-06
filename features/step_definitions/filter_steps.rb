Given /^I have the "([^\"]*)" publisher$/ do |publisher|
  @publisher = @gnap.publisher(publisher)
end

Then /^I should be able to get the "([^\"]*)" filter$/ do |filter|
  @publisher.filter(filter).should be_kind_of(Gnap::Filter)
end

Then /^I should be able to create filter "([^\"]*)"$/ do |name|
  @publisher.should_receive(:post).with("/gnip/publishers/#{@publisher}/filters.xml",
        "<?xml version=\"1.0\" encoding=\"UTF-8\"?><filter fullData=\"false\" name=\"#{name}\"><rule type=\"actor\">bazqux</rule></filter>")
  @filter = @publisher.create_filter!("foobar", :actor => "bazqux")
end

Then /^add an "([^\"]*)" rule with a value of "([^\"]*)"$/ do |type, value|
  @filter.should_receive(:post).with("/gnip/publishers/#{@publisher}/filters/#{@filter}/rules.xml",
       "<?xml version=\"1.0\" encoding=\"UTF-8\"?><rules><rule type=\"#{type}\">#{value}</rule></rules>")
  @filter.add_rule!(type, value)
end

Then /^I should be able to create filter "([^\"]*)" with a postback rule$/ do |name|
  @publisher.should_receive(:post).with("/gnip/publishers/delicious/filters.xml", "<?xml version=\"1.0\" encoding=\"UTF-8\"?><filter fullData=\"false\" name=\"foobar\"><postURL>http://some.url/path</postURL><rule type=\"actor\">bazqux</rule></filter>") 
  @filter = @publisher.create_filter!("foobar", :actor => "bazqux", :postURL => "http://some.url/path")
end

