=begin

  This is a spec that tests calls to account

=end

require 'spec_helper'
require 'mygengo'

describe MyGengo do

  # these are my account keys, so currency is set to USD

  before(:all) do

    @mygengo_client = MyGengo::API.new({
          :public_key => ! ENV['PUBLIC_KEY'].nil? ? ENV['PUBLIC_KEY'] : RSpec.configuration.mygengo_keys[:sandbox_keys][:public_key],
          :private_key => ! ENV['PRIVATE_KEY'].nil? ? ENV['PRIVATE_KEY'] : RSpec.configuration.mygengo_keys[:sandbox_keys][:private_key],
          :api_version => ! ENV['API_VERSION'].nil? ? ENV['API_VERSION'] : '2',
          :debug => ENV['DEBUG'] == 'true',
          :sandbox => true
    })

    @my_currency = "USD"
  end


  describe "getAccountBalance " do
    it "should be successful" do
      lambda do
        @mygengo_client.getAccountBalance
      end.should_not raise_error
    end
  end


  describe "getAccountBalance response hash" do
    it "should have opstat OK and response as hash" do
        resp = @mygengo_client.getAccountBalance
        resp.should be_an_instance_of(Hash)
        resp['opstat'].should eq('ok')
        useful_response_body = resp['response']
        useful_response_body.should be_an_instance_of(Hash)
    end
  end


  describe "getAccountBalance useful response" do

    before(:each) do
      resp = @mygengo_client.getAccountBalance
      @useful_response_body = resp['response']
    end

    it "should have a credits field as a string" do
      credits = @useful_response_body['credits']
      credits.should be_an_instance_of(String)
    end

    it "should have a currency field as a string" do
      currency = @useful_response_body['currency']
      currency.should be_an_instance_of(String)
    end

    it "should have a credits field convertable to non-zero float" do
      credits_string = @useful_response_body['credits']
      credits_string.to_f.should be > 0
    end

    it "should have a currency field as USD" do
      currency = @useful_response_body['currency']
      currency.should eq(@my_currency)
    end

  end


  describe "getAccountStats " do
    it "should be successful" do
      lambda do
        @mygengo_client.getAccountStats
      end.should_not raise_error
    end
  end


  describe "getAccountStats response hash" do
    it "should have opstat OK and response as hash" do
        resp = @mygengo_client.getAccountStats
        resp.should be_an_instance_of(Hash)
        resp['opstat'].should eq('ok')
        useful_response_body = resp['response']
        useful_response_body.should be_an_instance_of(Hash)
    end
  end

  describe "getAccountStats useful response" do

    before(:each) do
      resp = @mygengo_client.getAccountStats
      @useful_response_body = resp['response']
    end

    it "should have user_since as a Fixnum greater than 0" do
      user_since = @useful_response_body['user_since']
      user_since.should be_an_instance_of(Fixnum)
      user_since.should be > 0
    end

    it "should have credits_spent as a String" do
      credits_spent = @useful_response_body['credits_spent']
      credits_spent.should be_an_instance_of(String)
    end

    it "should have a currency field as a string" do
      currency = @useful_response_body['currency']
      currency.should be_an_instance_of(String)
    end

    it "should have a currency field as USD" do
      currency = @useful_response_body['currency']
      currency.should eq(@my_currency)
    end

  end

end