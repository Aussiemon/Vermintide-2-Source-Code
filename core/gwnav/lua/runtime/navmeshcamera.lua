require("core/gwnav/lua/safe_require")

local NavMeshCamera = safe_require_guard()
local NavClass = safe_require("core/gwnav/lua/runtime/navclass")
local NavMeshCamera = NavClass(NavMeshCamera)
local Math = stingray.Math
local Vector2 = stingray.Vector2
local Vector3 = stingray.Vector3
local Vector3Box = stingray.Vector3Box
local Matrix4x4 = stingray.Matrix4x4
local Matrix4x4Box = stingray.Matrix4x4Box
local Quaternion = stingray.Quaternion
local QuaternionBox = stingray.QuaternionBox
local Gui = stingray.Gui
local World = stingray.World
local Unit = stingray.Unit
local Camera = stingray.Camera
local ShadingEnvironment = stingray.ShadingEnvironment
local Application = stingray.Application
local Color = stingray.Color
local LineObject = stingray.LineObject
local PhysicsWorld = stingray.PhysicsWorld
local Level = stingray.Level
local Window = nil

if stingray.Window then
	Window = stingray.Window
end

local Script = stingray.Script
local BakedLighting = stingray.BakedLighting
local Keyboard = stingray.Keyboard
local Mouse = stingray.Mouse
local GwNavWorld = stingray.GwNavWorld
local GwNavBot = stingray.GwNavBot
local GwNavSmartObjectInterval = stingray.GwNavSmartObjectInterval
local GwNavQueries = stingray.GwNavQueries
local GwNavAStar = stingray.GwNavAStar
local GwNavTagVolume = stingray.GwNavTagVolume
local GwNavBoxObstacle = stingray.GwNavBoxObstacle
local GwNavCylinderObstacle = stingray.GwNavCylinderObstacle
local GwNavGraph = stingray.GwNavGraph
local GwNavTraversal = stingray.GwNavTraversal
local GwNavGeneration = stingray.GwNavGeneration
NavMeshCamera.init = function (self, camera, unit, nav_world)
	self.camera = camera
	self.unit = unit
	self.nav_world = nav_world
	self.translation_speed = 3

	if Application.platform() == "win32" then
		self.rotation_speed = 0.003
	else
		self.rotation_speed = 0.03
	end

	return 
end
NavMeshCamera.update = function (self, dt)
	local input = {}

	if Application.platform() == "win32" or Application.platform() == "macosx" then
		input.pan = Mouse.axis(Mouse.axis_id("mouse"))
		input.accelerate = Vector3.y(Mouse.axis(Mouse.axis_id("wheel")))
		input.move = Vector3(Keyboard.button(Keyboard.button_id("d")) - Keyboard.button(Keyboard.button_id("a")), Keyboard.button(Keyboard.button_id("w")) - Keyboard.button(Keyboard.button_id("s")), Keyboard.button(Keyboard.button_id("e")) - Keyboard.button(Keyboard.button_id("q")))
	else
		return 
	end

	local translation_change_speed = self.translation_speed * 0.1
	self.translation_speed = self.translation_speed + input.accelerate * translation_change_speed

	if self.translation_speed < 0.001 then
		self.translation_speed = 0.001
	end

	if 1000 < self.translation_speed then
		self.translation_speed = 1000
	end

	local cm = Camera.local_pose(self.camera)
	local pos = Matrix4x4.translation(cm)

	Matrix4x4.set_translation(cm, Vector3(0, 0, 0))

	local q1 = Quaternion(Vector3(0, 0, 1), -Vector3.x(input.pan) * self.rotation_speed)
	local q2 = Quaternion(Matrix4x4.x(cm), -Vector3.y(input.pan) * self.rotation_speed)
	local q = Quaternion.multiply(q1, q2)
	cm = Matrix4x4.multiply(cm, Matrix4x4.from_quaternion(q))
	local velocity = Matrix4x4.transform(cm, input.move * self.translation_speed)
	local move_on_navmesh = GwNavQueries.move_on_navmesh(self.nav_world, pos, velocity, dt)

	Matrix4x4.set_translation(cm, move_on_navmesh)
	Camera.set_local_pose(self.camera, self.unit, cm)

	return 
end

return NavMeshCamera
