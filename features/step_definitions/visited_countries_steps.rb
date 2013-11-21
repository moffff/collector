Given(/^the following visited coutries exist:$/) do |table|
  table.hashes.each do |visited_country_data|
    country = Country.where(:code => visited_country_data["code"]).first
    country.visited_countries.create
  end
end
