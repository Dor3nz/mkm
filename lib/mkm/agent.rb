require 'simple_oauth'

module Mkm
  class Agent < Struct.new(:connection, :auth)

    attr_reader :last

    def get(path)
      @last = connection.get path, {},
        authorization: oauth('get', "#{ connection.url_prefix }/#{ path }")

      @last.body
    end

    def put(path, body)
      raise NotImplementedError
    end
    def post(path, body)
      raise NotImplementedError
    end
    def delete(path)
      raise NotImplementedError
    end

    private

      def oauth(method, url, options = {})
        header = SimpleOAuth::Header.new method, url, options, auth
        signed_attributes = { realm: url }.update header.signed_attributes
        attributes = signed_attributes.map { |(k, v)| %(#{k}="#{v}") }

        "OAuth #{ attributes * ', ' }"
      end

  end
end
