require 'simple_oauth'
require 'oj'
require 'oj_mimic_json'

module Mkm
  class Agent < Struct.new(:connection, :auth)

    attr_reader :last

    def get(path)
      process :get, path, nil
    end
    def put(path, body = nil)
      process :put, path, body
    end

    def post(path, body)
      raise NotImplementedError
    end
    def delete(path)
      raise NotImplementedError
    end

    private

      def process(method, path, payload)
        json_path = "output.json/#{ path }"

        @last = connection.send method, json_path, payload,
          authorization: oauth(method, "#{ connection.url_prefix }/#{ json_path }")

        @last.body
      end

      def oauth(method, url, options = {})
        header = SimpleOAuth::Header.new method, url, options, auth
        signed_attributes = { realm: url }.update header.signed_attributes
        attributes = signed_attributes.map { |(k, v)| %(#{k}="#{v}") }

        "OAuth #{ attributes * ', ' }"
      end

  end
end
