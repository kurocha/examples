
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

required_version "0.5"

define_target "dream-examples" do |target|
	target.install do |environment|
		Teapot::Build.install_directory(package.path, 'source', environment)
	end
	
	target.depends "Language/C++11"
	target.depends "Library/Dream"
	
	target.provides "Application/dream-examples"
end
