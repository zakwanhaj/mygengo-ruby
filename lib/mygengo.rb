require 'rubygems'
require 'mygengo-ruby/api_handler'
require 'mygengo-ruby/mygengo_exception'

module MyGengo
	# Store global config objects here - e.g, urls, etc.
	module Config
		# API url endpoints; replace the version at function call time to
		# allow for function-by-function differences in versioning.
		API_HOST = 'api.gengo.com'
		SANDBOX_API_HOST = 'api.sandbox.mygengo.com'

		# Pretty self explanatory.
		VERSION = '1.16'
	end
end