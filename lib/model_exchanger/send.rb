require 'net/http'

module ModelExchanger
  class Send
    attr_reader :res
    def initialize(get_associations, url, service)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Post.new(url)
      @res = Net::HTTP.post_form(uri, 'hash' => get_associations, 'service' => service)
    end
  end
end
