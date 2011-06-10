require 'spec_helper'
require 'json'
require 'active_support'

describe CasperServer do
  include Rack::Test::Methods

  def app
    subject
  end

  it { get '/'; last_response.status.should == 200 }

  it 'POST /' do
    post '/', :casper => {
      :jrxml => Rack::Test::UploadedFile.new(File.join(File.dirname(__FILE__),'data/testreport.jrxml'), 'plain/text'),
      :data => Rack::Test::UploadedFile.new(File.join(File.dirname(__FILE__),'data/patients.xml'), 'plain/text'),
      :xpath => '//patient'
    }
    # 1613 is the length of the pdf and should prove it worked successfully
    last_response.body.length.should == 1613
  end

  it 'POST / content-type: application/json' do
    json = { :casper =>
      {
        :jrxml => Base64.encode64(open(File.join(File.dirname(__FILE__),'data/testreport.jrxml')).read),
        :data => Base64.encode64(open(File.join(File.dirname(__FILE__),'data/patients.xml')).read),
        :xpath => '//patient'
      }
    }.to_json

    header 'Content-Type','application/json'
    post '/', json
    # 1613 is the length of the pdf and should prove it worked successfully
    last_response.body.length.should == 1613
  end
  
  it 'POST / type: xls' do
    post '/', :casper => {
      :jrxml => Rack::Test::UploadedFile.new(File.join(File.dirname(__FILE__),'data/testreport.jrxml'), 'plain/text'),
      :data => Rack::Test::UploadedFile.new(File.join(File.dirname(__FILE__),'data/patients.xml'), 'plain/text'),
      :xpath => '//patient',
      :type => 'xls'
    }
    last_response.body.length.should > 0
  end

  # it 'POST / content-type: application/xml' do
  #   xml = { :casper =>
  #     {
  #       :jrxml => Base64.encode64(open(File.join(File.dirname(__FILE__),'data/testreport.jrxml')).read),
  #       :data => Base64.encode64(open(File.join(File.dirname(__FILE__),'data/patients.xml')).read),
  #       :xpath => '//patient'
  #     }
  #   }.to_xml
  #
  #   header 'Content-Type','application/xml'
  #   post '/', xml
  #   # 1613 is the length of the pdf and should prove it worked successfully
  #   last_response.body.length.should == 1613
  #
  # end


end
