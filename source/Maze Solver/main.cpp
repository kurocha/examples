//
//  main.cpp
//  Joint Blender
//
//  Created by Samuel Williams on 9/06/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#include <Dream/Display/Application.h>
#include <Dream/Client/Run.h>

#include "MazeSolverScene.h"

int main (int argc, const char * argv[])
{
	using namespace Dream;
	using namespace Dream::Core;
	using namespace Dream::Display;
	
	Ref<Dictionary> config = new Dictionary;
	Client::run(new MazeSolver::MazeSolverScene, config);
	
	return 0;
}
