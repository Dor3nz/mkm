require 'bundler/setup'
require 'faraday'

module Mkm

  path = ->(basename) {
    File.expand_path File.join('..', 'mkm', basename), __FILE__
  }
  autoload :Agent,    path['agent']
  autoload :Session,  path['session']
  autoload :Client,   path['client']
  autoload :Base,     path['base']
  autoload :Account,  path['account']

  def self.connect(url = 'https://www.mkmapi.eu/ws/v1.1')
    @connection = Faraday.new url, ssl: { verify: false } do |faraday|
      # faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end
  def self.connection
    @connection ||= connect
  end

  def self.auth(params)
    Session.new connection, params
  end

end
