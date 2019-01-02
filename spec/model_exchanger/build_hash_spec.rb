require 'spec_helper'

RSpec.describe ModelExchanger::BuildHash do
  models = ModelExchanger::BuildHash.new().models
  it 'User exists?' do
    expect(models).to include("User")
  end
  it 'Associations in hash?' do
    expect(models["User"]["associations"]).to have_key(:has_many)
  end
  it 'Got value in association?' do
    expect(models["User"]["associations"][:belongs_to]).to include(:test)
  end
  it 'Got nothing else in associations?' do
    models["User"]["associations"].each_key do |key, value|
      expect(value).to be_nil unless key == :belongs_to
    end
  end
  it 'Attributes in hash?' do
    expect(models["User"]["attributes"]).not_to be_empty
  end
  it 'got name in user attributes?' do
    expect(models["User"]["attributes"]).to include("name")
  end
  it 'is string the value of name?' do
    expect(models["User"]["attributes"]["name"]).to be(:string)
  end
end
