require 'spec_helper'

url = ''
service = 'Jobwert'
get_associations = {"Wz2008::Category"=>
  {"associations"=>{:has_many=>[], :belongs_to=>[], :has_one=>[], :has_and_belongs_to_many=>[:organisations]},
   "attributes"=>{"id"=>:integer, "wz_code"=>:string, "description_en"=>:string, "description_de"=>:string, "isic"=>:string, "ancestry"=>:string, "hierarchy"=>:string, "ancestry_depth"=>:integer}}}

RSpec.describe ModelExchanger::Send do

  it 'stub requests an GraphQL-Server'do
    expect(ModelExchanger::Send.new(get_associations,'https://octopus.pwi.pludoni.com/service_migration', service).res.code).to include("200")
  end
end

