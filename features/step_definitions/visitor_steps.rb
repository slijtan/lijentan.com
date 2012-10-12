Given /^the following (.+) records?$/ do |factory_name, table|
  table.hashes.each do |hash|
    FactoryGirl.create(factory_name, hash)
  end
end

Given /^I am on the homepage$/ do
  visit '/'
end

Then /^I should see ([0-9]+) posts?$/ do |count|
  all('article').count.should == count.to_i
end

Then /^I should see "(.*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "(.*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should see posts in this order: (.*)$/ do |post_names|
  page.body.should =~ Regexp.new(post_names.split(", ").join("(.|\n)*"))
end

Then /^I should see a "(.*)" tag with the class "(.*)"$/ do |tag_name, class_name|
  page.should have_selector("#{tag_name}.#{class_name}")
end
