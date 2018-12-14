require 'net/http'

module ModelExchanger
  class Send
    def initialize(get_associations, url, service)
      uri = URI(url)
      http = NET::HTTP.new(uri.host, uri.port)
      req = NET::HTTP::POST.new(uri)
      res = NET::HTTP.post_form(uri, 'hash' => get_associations, 'service' => service)
      puts res.body
    end
  end
end
