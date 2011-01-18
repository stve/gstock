require 'faraday_middleware'

module GStock

  class NotFound < StandardError; end

  class << self

    def quote(symbol)
      resp = get('/ig/api', :stock => symbol).xml_api_reply.finance
      resp.each do |key, value|
        resp[key] = value.kind_of?(Hashie::Mash) ? value.data : value
      end
      resp.reject! { |key, value | value.blank? }
      raise NotFound.new if resp.has_value?('UNKNOWN EXCHANGE')
      resp
    end

    def get(url, params={})
      response = connection.get do |req|
        req.url url, params
      end
      response.body
    end

    def connection
      @conn ||= Faraday::Connection.new(:url => 'http://www.google.com') do |builder|
        builder.adapter :typhoeus
        builder.use Faraday::Response::ParseXml
        builder.use Faraday::Response::Mashify
      end
    end

  end
end
