############# Some Helpers
Then /^I should print the page HTML$/ do
  p page.html
end

############# Given

Given /^the following (.+) records?$/ do |factory_name, table|
  table.hashes.each do |hash|
    FactoryGirl.create(factory_name, hash)
  end
end

Given /^I am on the homepage$/ do
  visit '/'
end

Given /^(\d+) posts that were published in order with title format "(.*?)"$/ do |total_posts, title_template|
  total_posts.to_i.times do |count|
    title = title_template.sub(/#/, (count + 1).to_s)
    date_published = Date.today + count
    FactoryGirl.create(:post, title: title, published: true, date_published: date_published)
  end
end

############# Then

Then /^I should see ([0-9]+) posts?$/ do |count|
  all('article').count.should == count.to_i
end

Then /^the post titled "(.*?)" should have a body with content "(.*?)"$/ do |title, body_content|
  find(:xpath, "//h1[text()=\"#{title}\"]/ancestor::article[1]/div[@class='body']").native.inner_html.delete("\n").strip.should == body_content
end

Then /^the post titled "(.*)" should have the (.*) "(.*)"$/ do |title, attribute, value|
  page.should have_selector(:xpath, "//h1[text()=\"#{title}\"]/ancestor::article[contains(@#{attribute},\"#{value}\")]")
end

Then /^the post titled "(.*)" should not have the (.*) "(.*)"$/ do |title, attribute, value|
  page.should_not have_selector(:xpath, "//h1[text()=\"#{title}\"]/ancestor::article[contains(@#{attribute},\"#{value}\")]")
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

Then /^I should see an? "(.*)" tag with the class "(.*)"$/ do |tag_name, class_name|
  page.should have_selector("#{tag_name}.#{class_name}")
end

Then /^I should see an? "(.*)" tag without a "(.*)" tag$/ do |outer_tag, inner_tag|
  page.should have_selector(outer_tag)
  page.should_not have_selector("#{outer_tag} #{inner_tag}")
end

Then /^I should see an? "(.*)" tag with the style "(.*)"$/ do |tag_name, style|
  page.should have_selector(tag_name, :style => style)
end

Then /^I should see an? "(.*)" tag without the style "(.*)"$/ do |tag_name, style|
  tag_found = false
  style_regexp = Regexp.new(style)

  all('article').each { |article| tag_found = true if article[:style] !=~ style_regexp }
  assert tag_found
end

Then /^I should see a nav bar with posts in this order: (.*)/ do |post_names|
  find('nav').text.should =~ Regexp.new(post_names.split(", ").join("(.|\n)*"))
end

Then /^I should see in the nav bar "(.*?)"$/ do |text|
  find("nav").should have_content(text)
end
