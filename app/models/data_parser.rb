class DataParser
  def initialize options={}
    @wsdl_url = options[:wsdl] || 'http://www.webservicex.net/country.asmx?WSDL'
  end

  def parse
    data = get_data_with_savon

    data.css('Table').collect do |table_data|
      load_currency table_data
    end

    data.css('Table').collect do |table_data|
      load_country table_data
    end
  end

  private
    def get_data_with_savon
      savon_client = Savon::Client.new(:wsdl => @wsdl_url)
      response = savon_client.call(:get_currencies)
      doc = response.body[:get_currencies_response][:get_currencies_result]
      Nokogiri::XML::Document.parse(doc)
    end

    def load_currency table_data
      name = table_data.css('Currency').text.strip
      code = table_data.css('CurrencyCode').text.strip
      Currency.find_or_create_by(:code => code, :name => name)
    end

    def load_country table_data
      name = table_data.css('Name').text.strip
      code = table_data.css('CountryCode').text.strip
      currency_code = table_data.css('CurrencyCode').text.strip

      currency = Currency.where(:code => currency_code).first
      currency.countries.find_or_create_by(:code => code, :name => name) if currency
    end
end
