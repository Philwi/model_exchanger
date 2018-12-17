require 'net/http'

module ModelExchanger
  class Send
    def initialize(get_associations, url, service)
      uri = URI(url)
      http = Class::Net::HTTP.new(uri.host, uri.port)
      req = Class::Net::HTTP::POST.new(uri)
      res = Class::Net::HTTP.post_form(uri, 'hash' => get_associations, 'service' => service)
      puts res.body
    end
  end
end
