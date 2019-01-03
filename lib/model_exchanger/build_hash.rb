module ModelExchanger
  class BuildHash


    def initialize()
      if defined?(Rails) && Rails.env == "development"
        Rails.application.eager_load!
      end
      @models = get_associations
    end

    attr_reader :models
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
          associations.each do |asso|
            if model.constantize.reflect_on_all_associations(asso)
              hash[model]['associations'][asso] = {}
              model.constantize.reflect_on_all_associations(asso).each do |association|
                hash[model]['associations'][asso].merge!(association.name => association.options)
              end
            end
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

    def associations
      [:has_many, :belongs_to, :has_one, :has_and_belongs_to_many]
    end
  end
end
