module Gnap
  class Connection
    include Net
    ApiUrl = "api-v21.gnip.com"

    attr_writer :publisher

    def initialize config
      config = config.symbolize_keys
      @http = HTTP.new(ApiUrl, 443)
      @http.use_ssl = true
      @config = config
      def @config.to_s; "*SNIP*"; end
      def @config.inspect; "*SNIP*"; end
    end

    def publisher name
      Publisher.new(@config, name)
    end

    private
    def prepare_request(type, path)
      returning type.new(path) do |req|
        req.basic_auth(@config[:username], @config[:password])
        req.content_type = "application/xml"
      end
    end

    def get(path)
      req = prepare_request(HTTP::Get, path)
      @http.request(req).body
    end

    def post(path, data)
      req = prepare_request(HTTP::Post, path)
      req.body = data
      @http.request(req).body
    end

    def put(path, data)
      req = prepare_request(HTTP::Put, path)
      req.body = data
      @http.request(req).body
    end
  end
end
