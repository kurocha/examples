
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "1.0"

define_target "maze-solver" do |target|
	target.build do |environment|
			source_root = target.package.path + 'source'
			
			copy headers: source_root.glob('Maze Solver/**/*.{h,hpp}')
			
			build executable: "maze-solver", source_files: source_root.glob('Maze Solver/**/*.cpp')
	end
	
	target.depends "Language/C++11"
	target.depends "Library/Dream/Client"
	
	target.provides "Application/MazeSolver"
end

define_configuration "examples" do |configuration|
	configuration[:source] = "https://github.com/dream-framework"
	
	configuration.require "project"
	configuration.require "tagged-format"
end
