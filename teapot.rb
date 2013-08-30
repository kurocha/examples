
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "0.8.0"

define_target "examples" do |target|
	target.build do |environment|
		build_directory(package.path, 'source', environment)
	end
	
	target.depends "Language/C++11"
	target.depends "Library/Dream/Client"
	
	target.provides "Application/Examples"
end

define_configuration "examples" do |configuration|
	configuration[:source] = "https://github.com/dream-framework"
	#configuration[:source] = "../"
	
	configuration.import! "project"
	configuration.require "tagged-format"
	
	configuration[:run] = ["Application/Examples"]
end
