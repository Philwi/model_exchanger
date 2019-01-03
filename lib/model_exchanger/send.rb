require 'net/http'

module ModelExchanger
  class Send
    attr_reader :res
    def initialize(get_associations, url, service)
      request = Typhoeus::Request.new(
        url,
        method: :post,
        body: { hash: get_associations.models.to_s, service: service },
        headers: { authorization: 'Basic dGVzdDoxdDVhIw==' }
      )
      @res = request.run
    end
  end
end
