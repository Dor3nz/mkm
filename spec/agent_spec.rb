require 'spec_helper'

describe Mkm::Agent do

  let(:connection) { double :connection, url_prefix: 'https://sandbox.mkmapi.eu/ws/v1.1/output.json' }
  let(:header) { double :header, signed_attributes: { oauth_signature: '====' } }
  let(:response) { double :response, :body => "body" }

  it "takes the url_prefix into account" do
    relative_path = 'test'
    expected_url  = "#{ connection.url_prefix }/#{ relative_path }"

    expect(SimpleOAuth::Header).to receive(:new).
      with(anything, expected_url, anything, anything).
      and_return(header)

    expect(connection).to receive(:get).
      with(relative_path, anything, anything).
      and_return(response)

    described_class.new(connection, nil).get relative_path
  end

  it 'generates an MKM compatible Authentication header' do
    allow(SimpleOAuth::Header).to receive(:new).and_return(header)

    expected_header = %Q'OAuth realm="#{ connection.url_prefix }/path", oauth_signature="===="'
    expect(connection).to receive(:get).
      with(anything, anything, hash_including(authorization: expected_header)).
      and_return(response)

    described_class.new(connection, nil).get 'path'
  end

  it "returns the response body" do
    allow(SimpleOAuth::Header).to receive(:new).and_return(header)
    allow(connection).to receive(:get).and_return(response)

    subject = described_class.new(connection, nil).get 'path'
    expect(subject).to eql("body")
  end

end
