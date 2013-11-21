Given(/^I am Mr\. Smart$/) do
  true
end

Given(/^the following currencies exist:$/) do |table|
  table.hashes.each do |currency_data|
    Currency.create currency_data
  end
end

Given(/^I am visited the page with all currencies$/) do
  visit currencies_path
end

Then(/^I should see the following currencies:$/) do |table|
  table.hashes.each do |currency_data|
    page.text.should have_content(currency_data[:name])
    page.text.should have_content(currency_data[:code])
  end
end

Then(/^I click on currency with name '(.+)'$/) do |currency_name|
  click_link currency_name
end

Then(/^I should see '(.+)'$/) do |text|
  page.text.should have_content text
end

Given(/^I should see (\d+) visited countries for currency '(.+)'$/) do |count, currency_name|
  block = find("tr", :text => currency_name)
  block.should have_content "Visited countries: #{count}"
end

Given(/^I should see (\d+) remaining countries for currency '(.+)'$/) do |count, currency_name|
  block = find("tr", :text => currency_name)
  block.should have_content "Remaining countries: #{count}"
end

Given(/^I should see (\d+) available countries for currency '(.+)'$/) do |count, currency_name|
  block = find("tr", :text => currency_name)
  block.should have_content "Available countries: #{count}"
end

