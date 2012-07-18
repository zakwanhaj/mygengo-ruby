require 'rake'

Gem::Specification.new do |gs|
	gs.name = "mygengo"
	gs.version = "1.10"
	gs.authors = [
		"Ryan McGrath",
		"Matthew Romaine",
		"Kim Alhstrom",
		"Lloyd Chan"
    ]
	gs.date = "2012-07-18"
	gs.summary = "A library for interfacing with the Gengo Translation API."
	gs.description = "Gengo is a service that offers various translation APIs, both machine and high quality human-sourced. The Gengo gem lets you interface with the Gengo REST API (http://gengo.com/services/api/dev-docs/)."
	gs.email = "api@gengo.com"
	gs.homepage = "http://gengo.com/services/api/dev-docs/"
	gs.files = FileList['lib/**/*.rb', 'licenses/*', 'bin/*', '[A-Z]*', 'test/**/*'].to_a
	gs.has_rdoc = true

	gs.add_dependency('json')
	gs.add_dependency('multipart-post')
	gs.add_dependency('mime-types')
end
