require 'spec_helper'

describe Mkm::Agent do

  let(:connection) { double :connection }
  let(:auth) { double :auth }

  subject { described_class.new connection, auth }

  it 'should request JSON output' do
    allow(subject).to receive(:oauth)
    allow(connection).to receive(:url_prefix)

    expect(connection).to receive(:get).
      with('output.json/test', nil, authorization: nil).
      and_return double(:response, body: '')

    subject.get 'test'
  end

  it 'should make GET requests' do
    expect(subject).to receive(:process).
      with(:get, 'get_test', nil)

    subject.get 'get_test'
  end

  it 'should make PUT requests' do
    expect(subject).to receive(:process).
      with(:put, 'put_test', nil)

    subject.put 'put_test'
  end

  it 'should make POST requests'

  it 'should make DELETE requests'

  it 'should add the authorization header to the request' do
    oauth = double :oauth
    response = double :response, body: nil
    allow(subject).to receive(:oauth).and_return oauth
    allow(connection).to receive(:url_prefix)

    expected_argument = hash_including authorization: oauth

    expect(connection).to receive(:get).
      with(anything, anything, expected_argument).
      and_return response

    subject.send :process, :get, 'test', nil
  end

  it 'should build OAuth headers' do
    header = double :header, signed_attributes: {}

    expect(SimpleOAuth::Header).to receive(:new).
      with(:method, 'url', {}, auth).
      and_return header

    subject.send :oauth, :method, 'url'
  end

  it 'should build the authorization string' do
    header = double :header, signed_attributes: { 'foo' => 'bar' }
    authorization_string = 'OAuth realm="url", foo="bar"'

    allow(SimpleOAuth::Header).to receive(:new).
      and_return header

    expect(subject.send :oauth, :method, 'url').to eq authorization_string
  end

  it 'should add realm to OAuth headers' do
    header = double :header, signed_attributes: {}

    allow(SimpleOAuth::Header).to receive(:new).
      and_return header

    expect(subject.send :oauth, :method, 'realm').to eq 'OAuth realm="realm"'
  end

end
