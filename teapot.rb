
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "0.7.0"

define_target "dream-examples" do |target|
	target.build do |environment|
		build_directory(package.path, 'source', environment)
	end
	
	target.depends "Language/C++11"
	target.depends "Library/Dream"
	
	target.provides "Application/DreamExamples"
end

define_configuration "dream-examples" do |configuration|
	#configuration[:source] = "https://github.com/dream-framework"
	configuration[:source] = "../"
	
	configuration.import! "project"
	configuration.require "tagged-format"
end
