namespace :wsdl_parser do
  desc 'Load all data from http://www.webservicex.net/country.asmx?WSDL'
  task :load_data => :environment do
    DataParser.new.parse
    puts "Done."
  end
end

