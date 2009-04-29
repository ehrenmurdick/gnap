module Gnap
  class Connection
    include Net

    attr_writer :publisher

    def initialize config
      config = config.symbolize_keys
      def config.inspect; "*SNIP*"; end
      @http = HTTP.new(config[:uri] || "api-v21.gnip.com", 443)
      @http.use_ssl = true
      @config = config
    end

    def publisher name
      Publisher.new(@config, name)
    end

    private
    def prepare_request(type, path)
      returning type.new(path) do |req|
        req.basic_auth(@config[:username], @config[:password])
      end
    end

    def get(path)
      req = prepare_request(HTTP::Get, path)
      @http.request(req).body
    end

    def post(path, data)
      req = prepare_request(HTTP::Post, path)
      req.body = data
      req.content_type = "application/xml"
      @http.request(req).body
    end
  end
end
