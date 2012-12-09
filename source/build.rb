
require 'teapot/build/component'

add_application 'Sakura Heart' do
	compile_executable 'Sakura Heart' do
		def source_files(environment)
			FileList[root, 'Sakura Heart/**/*.{cpp,m,mm}']
		end
	end
	
	copy_files do
		def source_files(environment)
			FileList[root + "Sakura Heart/resources", '**/*']
		end
	end
end

add_application 'Maze Solver' do
	compile_executable 'Maze Solver' do
		def source_files(environment)
			FileList[root, 'Maze Solver/**/*.{cpp,m,mm}']
		end
	end
	
	copy_files do
		def source_files(environment)
			FileList[root + "Maze Solver/resources", '**/*']
		end
	end
end
