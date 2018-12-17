
module ModelExchanger
  require 'net/http'
  class Send
    def initialize(get_associations, url, service)
      uri = URI(url)
      http = Class::NET::HTTP.new(uri.host, uri.port)
      req = Class::NET::HTTP::POST.new(uri)
      res = Class::NET::HTTP.post_form(uri, 'hash' => get_associations, 'service' => service)
      puts res.body
    end
  end
end
