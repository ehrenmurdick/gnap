Then /^I should be able to construct requests$/ do
  req = Net::HTTP::Get.new("path")
  Net::HTTP::Get.should_receive(:new).with("path").and_return(req)
  @gnap.send(:prepare_request, Net::HTTP::Get, "path")
end

Then /^I should be able to make get requests$/ do
  fake_http = Object.new
  resp = Object.new
  resp.stub!(:body).and_return("body")
  fake_http.should_receive(:request).and_return(resp)
  @gnap.instance_variable_set("@http", fake_http)
  @gnap.send(:get, "path")
end

Then /^I should be able to make post requests$/ do
  fake_http = Object.new
  resp = Object.new
  resp.stub!(:body).and_return("body")
  fake_http.should_receive(:request).and_return(resp)
  @gnap.instance_variable_set("@http", fake_http)
  @gnap.send(:post, "some/path", "some data")
end
