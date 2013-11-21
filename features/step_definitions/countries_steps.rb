Given(/^the following coutries exist:$/) do |table|
  table.hashes.each do |country_data|
    currency = Currency.where(:code => country_data["currency_code"]).first
    Country.create country_data.except("currency_code").merge(:currency_id => currency.id)
  end
end

Then(/^I should see the country '(.+)' and code '(.+)'$/) do |country_name, country_code|
  page.text.should have_content(country_name)
  page.text.should have_content(country_code)
end

Then(/^I click on '(.+)' link for country '(.+)'$/) do |link_text, country_name|
  block = find("li", :text => country_name)
  block.find("a", :text => link_text).click
end

