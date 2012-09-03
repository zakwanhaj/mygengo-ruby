require 'rubygems'
require 'bundler/setup'

require 'mygengo' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here

  # Create an suite - wide set of clients that we can choose from for the different versions
  # and endpoints
  config.add_setting :mygengo_keys
  config.before(:suite){
    RSpec.configuration.mygengo_keys = {
      #these are my (Lloyd) keys in live/staging/qa and sandbox
      :sandbox_keys => {
          :public_key => ENV['SANDBOX_PUBLIC_KEY'] || 'Kqw3@uQ=UYejce5U3u-P6s6-A}i#UELr8-g4oaA~eRSfjFu{HS@j@{4=]}rmoaOR',
          :private_key => ENV['SANDBOX_PRIVATE_KEY'] || 'WHOWYPoPn7oCoZ@wn~76V=DWLOue{8{pkNS$ym#[e3t2qY|SEN7erfJS3cqcdngv'
      }
    }
  }
end