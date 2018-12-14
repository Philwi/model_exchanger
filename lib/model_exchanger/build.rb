module ModelExchanger
  class Build
    def initialize(url, service)
      ModelExchanger::Send.new(ModelExchanger::BuildHash.new, url, service)
    end
  end
end
