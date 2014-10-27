require 'bundler/setup'

require 'faraday'
require 'faraday_middleware'

module Mkm

  def self./(path)
    path = File.join '..', 'mkm', path.split('/')
    File.expand_path path, __FILE__
  end

  autoload :Agent,   self / 'agent'
  autoload :Session, self / 'session'
  autoload :Entity,  self / 'entity'
  autoload :Service, self / 'service'

  LANGUAGES = [ nil, :en, :fr, :de, :es, :it, :zh_CN, :jp, :pt, :ru, :ko, :zh_TW ]

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

  def self.auth(params)
    Session.new Agent.new(connection, params)
  end

end
