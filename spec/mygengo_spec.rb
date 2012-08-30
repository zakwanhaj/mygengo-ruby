require 'spec_helper'
describe MyGengo do

    context 'basic instantiation' do
        it 'should work' do
            lambda do
                @gengo_client = MyGengo::API.new({
                                  :public_key => 'your_public_key',
                                  :private_key => 'your_private_key',
                                  :sandbox => true,
                                })
            end.should_not raise_error
        end
    end

    context 'endpoint checking' do

        it 'should have the right Sandbox url' do
            @gengo_client = MyGengo::API.new({
                                  :public_key => 'your_public_key',
                                  :private_key => 'your_private_key',
                                  :sandbox => true,
                                })
            @gengo_client.api_host.should eq('api.sandbox.mygengo.com')
        end

        it 'should have the right production url' do
            @gengo_client = MyGengo::API.new({
                                  :public_key => 'your_public_key',
                                  :private_key => 'your_private_key',
                                  :sandbox => false,
                                })
            @gengo_client.api_host.should eq('api.gengo.com')
        end

    end
end