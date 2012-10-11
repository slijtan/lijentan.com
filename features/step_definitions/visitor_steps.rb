Given /^a post published on (.*) with the title "(.+)"$/ do |date_published, title|
  FactoryGirl.create(:post, title: title, published: true, date_published: date_published)
end

Given /^an unpublished post with the title "(.+)"$/ do |title|
  FactoryGirl.create(:post, title: title, published: false)
end

Given /^I am on the homepage$/ do
  visit '/'
end

Then /^I should see ([0-9]+) posts$/ do |count|
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
