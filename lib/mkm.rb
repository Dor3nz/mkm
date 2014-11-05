require 'bundler/setup'

require 'faraday'
require 'faraday_middleware'
require 'oj'

module Mkm
  def self./(path)
    path = File.join '..', 'mkm', path.split('/')
    File.expand_path path, __FILE__
  end

  autoload :Agent,   self / 'agent'
  autoload :Session, self / 'session'
  autoload :Entity,  self / 'entity'
  autoload :Service, self / 'service'

  LANGUAGES = [nil, :en, :fr, :de, :es, :it, :zh_CN, :jp, :pt, :ru, :ko, :zh_TW]

  def self.connect(url = 'https://www.mkmapi.eu/ws/v1.1')
    @connection = Faraday.new url, ssl: { verify: false } do |faraday|
      # faraday.request :oauth
      # faraday.response :logger
      faraday.response :json, content_type: /\bjson$/
      faraday.adapter Faraday.default_adapter
    end
  end
  def self.connection
    @connection ||= connect
  end

  def self.auth(params = nil)
    fail 'cannot authenticate without params' unless params ||= load_params

    agent = Agent.new connection, transform(params)
    Session.new agent
  end

  private

  def self.load_params
    mkmrc_path = File.join ENV['HOME'], '.mkmrc'
    Oj.load File.read(mkmrc_path) if File.readable? mkmrc_path
  end

  def self.transform(params)
    {
      consumer_key:    get(params, :consumer_key, :app_token),
      consumer_secret: get(params, :consumer_secret, :app_secret),
      token:           get(params, :token, :access_token),
      token_secret:    get(params, :token_secret, :access_token_secret)
    }
  end

  def self.get(params, key, variation)
    value = params[key] ||
            params[key.to_s] ||
            params[variation] ||
            params[variation.to_s]

    value || fail(ArgumentError, "missing #{ key } or #{ variation }")
  end
end
