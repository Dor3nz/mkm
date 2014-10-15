require 'spec_helper'

describe Mkm::Session do

  let(:faraday_connection) {
    double :faraday_connection,
      url_prefix: 'https://www.mkmapi.eu/ws/v1.1/output.json'
  }

  let(:response) {
    double :response,
      :body => "body"
  }

  it "gets the body of the response" do

    expect(Mkm::OAuthHeader).to receive(:new).
      with('get', 'https://www.mkmapi.eu/ws/v1.1/output.json/path', {}, :oauth).
      and_return('OAuth')

    expect(faraday_connection).to receive(:get).
      with("path", {}, :authorization => "OAuth").
      and_return(response)

    subject = described_class.new(faraday_connection, :oauth).get 'path'
    expect(subject).to eql("body")
  end

end
