require "model_exchanger/version"
require 'net/http'

module ModelExchanger
  def initialize(url, service)
    if Rails.env == "development"
      Rails.application.eager_load!
    end
    send_to_graphql_server(get_associations, url, service)
  end

  protected

  def get_all_models
    ActiveRecord::Base.descendants.map(&:name)
  end

  def get_associations
    hash = Hash.new
    get_all_models.each do |model|
      hash[model] = {}
      begin
        hash[model]['associations'] = {}
        if model.constantize.reflect_on_all_associations(:has_many)
          hash[model]['associations'].merge!(:has_many => model.constantize.reflect_on_all_associations(:has_many).map(&:name))
        end
        if model.constantize.reflect_on_all_associations(:belongs_to)
          hash[model]['associations'].merge!(:belongs_to => model.constantize.reflect_on_all_associations(:belongs_to).map(&:name) )
        end
        if model.constantize.reflect_on_all_associations(:has_one)
          hash[model]['associations'].merge!(:has_one => model.constantize.reflect_on_all_associations(:has_one).map(&:name))
        end
        if model.constantize.reflect_on_all_associations(:has_and_belongs_to_many)
          hash[model]['associations'].merge!(:has_and_belongs_to_many => model.constantize.reflect_on_all_associations(:has_and_belongs_to_many).map(&:name))
        end
        hash[model]['attributes'] = get_all_attributes_and_types_of_a_model(model)
      rescue StandardError => e
        puts e
      end
    end
    hash
  end

  def get_all_attributes_and_types_of_a_model(model)
    hash = {}
    model.constantize.columns_hash.each do |key, value|
      hash.merge!(key => value.type)
    end
    hash
  end

  def send_to_graphql_server(get_associations, url, service)
    uri = URI(url)
    http = NET::HTTP.new(uri.host, uri.port)
    req = NET::HTTP::POST.new(uri)
    res = NET::HTTP.post_form(uri, 'hash' => get_associations, 'service' => service)
    puts res.body
  end
end
