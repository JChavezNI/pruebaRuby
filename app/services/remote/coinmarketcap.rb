class Remote::Coinmarketcap
  include HTTParty
  #Fixme: Lo ideal es usar una variable de entorno pero pues para motivos de prueba lo dejo así
  base_uri ENV.fetch('COINMARKETCAP_API_BASE_URL') { 'https://pro-api.coinmarketcap.com' }

  def self.coins
    value = {}
    begin
      response = get('/v1/cryptocurrency/quotes/latest', self.hard_options)
      value = response.parsed_response
    rescue => error
      Rails.logger.error("Error on json marketcap response #{error}")
    end
    value
  end

  private

  def self.hard_options
    { query: default_query, headers: default_headers }
  end

  def self.default_query
    { slug: 'bitcoin,ethereum' }
  end

  def self.default_headers
    {
      # Fixme: Lo ideal es usar una variable de entorno pero pues para motivos de prueba lo dejo así
      'X-CMC_PRO_API_KEY': "061127e8-138b-49a8-9ab4-afa63039fd9f",
      'Accept': 'application/json',
      'Accept-Encoding': 'deflate,gzip'
    }
  end
end