Given /^a post with the title "(.+)"$/ do |title|
  FactoryGirl.create(:post, title: title)
end

Given /^I am on the homepage$/ do
  visit '/'
end

Then /^I should see "(.*)"$/ do |text|
  page.should have_content(text)
end
