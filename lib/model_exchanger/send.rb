require 'net/http'

module ModelExchanger
  class Send
    def initialize(get_associations, url, service)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Post.new(url)
      #res = Net::HTTP.post_form(uri, 'hash' => get_associations, 'service' => service)
      res = Net::HTTP.get("#{url}?hash=get_associations&service=service")
      puts res.body
    end
  end
end
