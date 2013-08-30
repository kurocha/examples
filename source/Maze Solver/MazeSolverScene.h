/*
 *  MazeSolverScene.h
 *  Dream
 *
 *  Created by Samuel Williams on 21/09/06.
 *  Copyright 2006 Samuel G. D. Williams. All rights reserved.
 *
 */

#ifndef __MAZE_SOLVER_SCENE_H
#define __MAZE_SOLVER_SCENE_H

#include <Dream/Graphics/ShaderManager.h>
#include <Dream/Graphics/TextureManager.h>
#include <Dream/Graphics/WireframeRenderer.h>

#include <Dream/Renderer/Viewport.h>
#include <Dream/Renderer/BirdsEyeCamera.h>
#include <Dream/Renderer/PointCamera.h>
#include <Dream/Renderer/Projection.h>

#include <Dream/Events/Logger.h>

#include <Dream/Graphics/MeshBuffer.h>

#include <Dream/Graphics/Renderer.h>
#include <Dream/Graphics/ParticleRenderer.h>

#include <Euclid/Numerics/Quaternion.h>
#include <Euclid/Geometry/Generate/Planar.h>
#include <Euclid/Geometry/Generate/Cylinder.h>

#include "Maze.h"

namespace MazeSolver {
	using namespace Dream;
	using namespace Dream::Renderer;
	using namespace Dream::Graphics;

	class MazeSolverScene : public Scene {
	protected:	
		//Grid *_grid;
		//Axes *_axes;
		Shared<Maze> _maze;
		//Mesh *_lightMesh, *_test;

		Ref<RendererState> _renderer_state;
		
		Ref<BirdsEyeCamera> _camera;
		Ref<Viewport> _viewport;
		
		Ref<Program> _flat_program, _wireframe_program;

		Ref<WireframeRenderer> _wireframe_renderer;

		typedef Euclid::Geometry::Mesh<> MeshT;
		typedef MeshBuffer<MeshT> MeshBufferT;

		Ref<MeshBufferT> _floor_mesh_buffer, _wall_mesh_buffer, _grid_mesh_buffer;

		Shared<MazePathFinder> _path_finder;
		
		RealT _last_find;
		bool _finished;
		unsigned _seed;

		enum {
			POSITION = 0,
			NORMAL = 1,
			MAPPING = 2
		};

		//ParticleSystem *_particleSystem;
	public:
		virtual void will_become_current(ISceneManager *);
		virtual void will_revoke_current(ISceneManager *);

		virtual bool motion (const MotionInput & input);
		virtual bool resize (const ResizeInput & input);

		void reset_maze();
		void render_frame_for_time(TimeT time);
		
	};

}

#endif
