module Livechat
  class API # inherited by Client
    attr_accessor *Config::VALID_OPTIONS_KEYS

    # Livechat::Client.new
    def initialize(options={})
      options = Livechat.options.merge(options)
      Config::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      yield self if block_given?
    end

    def basic_auth(login, api_key)
      @login, @api_key = login, api_key
    end

  end
end