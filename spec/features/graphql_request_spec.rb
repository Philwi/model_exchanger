require 'spec_helper'

RSpec.describe 'GraphQL-Server request' do
  it 'queries GraphQL-Servers root page' do
    uri = URI('https://octopus.pwi.pludoni.com/service_migration')
    response = Net::HTTP.post(uri, 'query=foo')
    expect(response.code).to include("200")
  end
end
