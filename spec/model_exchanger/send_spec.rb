require 'spec_helper'

url = ''
service = 'Jobwert'
get_associations = ''

RSpec.describe ModelExchanger::Send do

  it 'stub requests an GraphQL-Server'do
    expect(ModelExchanger::Send.new(get_associations, url, service)).to include("200")
  end

end

