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

Given(/^the following coutries exist:$/) do |table|
  table.hashes.each do |country_data|
    currency = Currency.where(:code => country_data["currency_code"]).first
    Country.create country_data.except("currency_code").merge(:currency_id => currency.id)
  end
end

Then(/^I click on currency with name '(.+)'$/) do |currency_name|
  click_link currency_name
end

Then(/^I should see the country '(.+)' and code '(.+)'$/) do |country_name, country_code|
  page.text.should have_content(country_name)
  page.text.should have_content(country_code)
end

Then(/^I should see '(.+)'$/) do |text|
  page.text.should have_content text
end

Then(/^I click on '(.+)' link for country '(.+)'$/) do |link_text, country_name|
  block = find("li", :text => country_name)
  block.find("a", :text => link_text).click
end

Given(/^the following visited coutries exist:$/) do |table|
  table.hashes.each do |visited_country_data|
    country = Country.where(:code => visited_country_data["code"]).first
    country.visited_countries.create
  end
end

Given(/^I should see (\d+) visited countries for currency '(.+)'$/) do |count, currency_name|
  block = find("tr", :text => currency_name)
  block.should have_content "Visited countries: #{count}"
end

Given(/^I should see (\d+) remaining countries for currency '(.+)'$/) do |count, currency_name|
  block = find("tr", :text => currency_name)
  block.should have_content "Remaining countries: #{count}"
end
