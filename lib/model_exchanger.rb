require "model_exchanger/version"

module ModelExchanger
  ModelExchanger::Send.new(ModelExchanger::BuildHash.new, url, service)
end
