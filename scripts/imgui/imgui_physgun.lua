local V3 = stingray.Vector3
local QQ = stingray.Quaternion
local M4 = stingray.Matrix4x4
local Imgui = stingray.Imgui
local Unit = Unit

local function Imgui_datum(label, fmt, ...)
	Imgui.text_colored(label, 200, 200, 255, 255)
	Imgui.same_line()
	Imgui.text(string.format(fmt, ...))
end

ImguiPhysgun = class(ImguiPhysgun)

ImguiPhysgun.init = function (self)
	self._delayed_initialization_done = false
	self._camera_locked = false
	self._is_rotating = false
end

ImguiPhysgun._delayed_initialization = function (self)
	local ai_system = Managers.state and Managers.state.entity:system("ai_system")

	if not ai_system then
		return
	end

	local world = ai_system.world
	self._world = world
	self._physics_world = World.physics_world(world)
	self._line_object = World.create_line_object(world)

	print("[ImguiPhysgun] Delayed initialization done")

	self._delayed_initialization_done = true
end

ImguiPhysgun.is_persistent = function (self)
	return true
end

ImguiPhysgun.destroy_gui = function (self)
	local world = self._world
	local gui = self._gui_navmesh

	if world and gui then
		World.destroy_gui(self._world, gui)

		self._gui_navmesh = nil
	end
end

ImguiPhysgun.destroy = function (self)
	local world = self._world

	if world then
		local line_object = self._line_object

		LineObject.reset(line_object)
		LineObject.dispatch(world, line_object)
		World.destroy_line_object(world, line_object)

		self._world = nil
	end

	self:destroy_gui()
	self:set_camera_lock(false)
end

ImguiPhysgun.get_player_pos_rot = function (self)
	local player = Managers.player:local_player()
	local player_unit = player and player.player_unit

	if not ALIVE[player_unit] then
		return
	end

	local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")
	local camera_position = first_person_extension:current_position()
	local camera_rotation = first_person_extension:current_rotation()

	return camera_position, camera_rotation
end

local function hexchr(c)
	return string.format("\\x%02x", string.byte(c))
end

local function hexstr(s)
	return string.gsub(s, ".", hexchr)
end

ImguiPhysgun.show_unit_info = function (self, unit)
	local Unit = Unit

	Imgui_datum("ID string", "%s", Unit.id_string(unit))
	Imgui_datum("Level ID", "%s", Unit.level_id_string(unit))
	Imgui_datum("Debug name", "%q", Unit.debug_name(unit))
	Imgui_datum("Name hash", "%s", hexstr(Unit.name_hash(unit)))
	Imgui_datum("Position", "%s", tostring(Unit.local_position(unit, 0)))
	Imgui_datum("Rotation", "%s", tostring(Unit.local_rotation(unit, 0)))
	Imgui_datum("Scale", "%s", tostring(Unit.local_scale(unit, 0)))
	Imgui_datum("Mesh#", Unit.num_meshes(unit))
	Imgui_datum("Actor#", Unit.num_actors(unit))
	Imgui_datum("Light#", Unit.num_lights(unit))
	Imgui_datum("Cameras#", Unit.num_cameras(unit))
	Imgui_datum("Is frozen?", Unit.is_frozen(unit) and "yes" or "no")
end

local function input_device(DEVICE)
	return setmetatable({}, {
		__index = function (self, key)
			local id = DEVICE.button_index(key)
			local default_method = "pressed"

			if not id then
				id = DEVICE.axis_index(key)
				default_method = "axis"
			end

			assert(id, "Not such button or axis: " .. tostring(key))

			local function func(method)
				if method == "held" then
					return DEVICE.button(id) > 0.5
				end

				return DEVICE[method or default_method](id)
			end

			self[key] = func

			return func
		end
	})
end

local key = input_device(Keyboard)
local mouse = input_device(Mouse)
local BINDING_DEFINITIONS = {
	mouse = mouse.mouse,
	cursor = mouse.cursor,
	move_right = key.d,
	move_left = key.a,
	move_forward = key.w,
	move_back = key.s,
	snap_angles = key["left shift"],
	grab = mouse.left,
	rotate = mouse.right,
	arcball = key.e,
	generate_navmesh = key.f1,
	wheel = function (_method)
		return mouse.wheel("axis").y
	end,
	spawn_seedpoint = key.f,
	delete_unit = key.backspace,
	spawn_cylinder = key.c
}

local function input_get(binding, method)
	return BINDING_DEFINITIONS[binding](method)
end

ImguiPhysgun.set_camera_lock = function (self, bool)
	if bool ~= self._camera_locked then
		if bool then
			Managers.input:capture_input(ALL_INPUT_METHODS, 1, "imgui", "ImguiManager")
		else
			Window.set_show_cursor(false)
			Managers.input:release_input(ALL_INPUT_METHODS, 1, "imgui", "ImguiManager")
		end

		self._camera_locked = bool
	end
end

ImguiPhysgun.can_grab = function (self, actor)
	if not actor then
		return false, "actor is nil"
	end

	local unit = Actor.unit(actor)

	if Unit.is_a(unit, "core/editor_slave/units/animation_preview_tile/animation_preview_tile") then
		return false, "unit is the floor"
	end

	return true
end

ImguiPhysgun.grab_begin = function (self, pos, rot, grab_actor, grab_pos)
	local unit = Actor.unit(grab_actor)
	local unit_pos = Unit.local_position(unit, 0)
	local unit_rot = Unit.local_rotation(unit, 0)
	self._physgun_unit = unit
	self._physgun_actor = grab_actor
	local inv_rot = QQ.inverse(rot)
	self._physgun_pos = Vector3Box(QQ.rotate(inv_rot, unit_pos - pos))
	self._physgun_rot = QuaternionBox(QQ.multiply(inv_rot, unit_rot))
	self._physgun_pivot = Vector3Box(QQ.rotate(inv_rot, grab_pos - unit_pos))
	self._wheel_speed = 0
	self._physgun_dist = Vector3.distance(pos, grab_pos)
	local world = self._world
	local actor_poses = self._physgun_actor_poses

	if not actor_poses then
		actor_poses = {}
		self._physgun_actor_poses = actor_poses
	end

	local inv_unit_pose = M4.inverse(Unit.local_pose(unit, 0))

	for i = 0, Unit.num_actors(unit) - 1 do
		local actor = Unit.actor(unit, i)

		if actor and Actor.is_static(actor) then
			actor_poses[actor] = Matrix4x4Box(M4.multiply(Actor.pose(actor), inv_unit_pose))
		end
	end
end

ImguiPhysgun.grab_end = function (self)
	self._physgun_unit = nil
	self._physgun_actor = nil
	self._physgun_pos = nil
	self._physgun_rot = nil
	self._physgun_pivot = nil
	self._physgun_dist = nil

	table.clear(self._physgun_actor_poses)

	self._is_rotating = false
end

local function arcball_cursor()
	local cursor = input_get("cursor")
	local w, h = Gui.resolution()
	local s = 1 / math.min(w, h)
	local x = (2 * cursor.x - w) * s
	local y = (2 * cursor.y - h) * s
	local l = x * x + y * y

	return V3(x, y, l < 0.5 and math.sqrt(1 - l) or 0.5 / math.sqrt(l))
end

ImguiPhysgun.grab_update = function (self, dt, pos, rot)
	local unit = self._physgun_unit
	local actor = self._physgun_actor
	local physgun_pos = self._physgun_pos:unbox()
	local physgun_rot = self._physgun_rot:unbox()
	local target_pos, target_rot = nil
	local wheel_accel = 0.1 * input_get("wheel") / dt
	local wheel_speed = self._wheel_speed * math.exp(-15 * dt) + wheel_accel
	self._wheel_speed = wheel_speed
	local wheel_delta = wheel_speed * dt
	local is_rotating = input_get("rotate", "held")

	if is_rotating ~= self._is_rotating then
		self._is_rotating = is_rotating

		if not is_rotating then
			Window.set_clip_cursor(false)
			Window.set_show_cursor(false)
		end

		self:set_camera_lock(is_rotating)
	end

	if is_rotating then
		local mouse_rot_delta = nil

		if input_get("arcball", "pressed") then
			Window.set_clip_cursor(true)
			Window.set_show_cursor(true)
			Window.set_cursor_position(V3(0.5, 0.5, 0))
		elseif input_get("arcball", "released") then
			Window.set_clip_cursor(false)
			Window.set_show_cursor(false)
		end

		if input_get("arcball", "held") then
			if input_get("grab", "pressed") then
				self._trackball_start = Vector3Box(arcball_cursor())
			elseif input_get("grab", "released") then
				self._trackball_start = nil
			elseif input_get("grab", "held") and self._trackball_start then
				local P = self._trackball_start:unbox()
				local Q = arcball_cursor()
				local axis = QQ.rotate(rot, V3.cross(P, Q))
				local angle = math.acos(math.min(1, V3.dot(P, Q)))

				if angle > 0.001 then
					mouse_rot_delta = QQ.multiply(QQ.axis_angle(axis, angle), QQ.inverse(physgun_rot))
				end
			end
		else
			local mouse = input_get("mouse")
			local angular_speed = 2 * math.pi / math.min(Gui.resolution())
			local key_yaw = input_get("move_right", "button") - input_get("move_left", "button")
			mouse_rot_delta = QQ.from_yaw_pitch_roll((mouse.x + key_yaw) * angular_speed, mouse.y * angular_speed, 0)
		end

		if mouse_rot_delta then
			physgun_rot = QQ.multiply(mouse_rot_delta, physgun_rot)

			self._physgun_rot:store(physgun_rot)

			local pivot = self._physgun_pivot:unbox()
			local new_pivot = QQ.rotate(mouse_rot_delta, pivot)

			self._physgun_pivot:store(new_pivot)

			physgun_pos = physgun_pos + pivot - new_pivot
		end

		wheel_delta = wheel_delta + 10 * dt * (input_get("move_forward", "button") - input_get("move_back", "button"))
	end

	physgun_pos = physgun_pos + V3(0, wheel_delta, 0)

	self._physgun_pos:store(physgun_pos)

	if input_get("snap_angles", "held") then
		local x, y, z = QQ.to_euler_angles_xyz(physgun_rot)
		x = math.round(x / 45) * 45
		y = math.round(y / 45) * 45
		z = math.round(z / 45) * 45
		physgun_rot = QQ.from_euler_angles_xyz(x, y, z)
	end

	local world_pos = pos + QQ.rotate(rot, physgun_pos)
	local world_rot = QQ.multiply(rot, physgun_rot)

	Unit.set_local_position(unit, 0, V3.lerp(Unit.local_position(unit, 0), world_pos, 0.25))
	Unit.set_local_rotation(unit, 0, QQ.lerp(Unit.local_rotation(unit, 0), world_rot, 0.25))

	local actor_poses = self._physgun_actor_poses
	local unit_pose = Unit.local_pose(unit, 0)

	for actor, actor_pose in pairs(actor_poses) do
		Actor.teleport_pose(actor, M4.multiply(actor_pose:unbox(), unit_pose))
	end

	local color = is_rotating and (input_get("arcball", "held") and Color(255, 0, 0) or Color(0, 255, 0)) or Color(255, 255, 0)

	Actor.debug_draw(actor, self._line_object, color)
	self:laser_update(rot)
end

ImguiPhysgun.laser_update = function (self, rot)
	return
end

ImguiPhysgun.do_grab = function (self, dt, pos, rot, grab_actor, grab_pos)
	if not self._physgun_actor then
		local wants_rotate = input_get("rotate", "held")

		if wants_rotate or input_get("grab", "held") then
			local can_grab, fail_reason = self:can_grab(grab_actor)

			if can_grab then
				self:grab_begin(pos, rot, grab_actor, grab_pos)

				if wants_rotate then
					self._is_rotating = true

					self:set_camera_lock(true)
				end
			else
				Debug.text("Cannot grab unit: %s", fail_reason)
			end
		end
	else
		local unit = self._physgun_unit

		if not Unit.alive(unit) or not self._is_rotating and not input_get("grab", "held") then
			self:grab_end()
			self:set_camera_lock(false)
		else
			self:grab_update(dt, pos, rot)
		end
	end
end

ImguiPhysgun.on_hide = function (self)
	if self._delayed_initialization_done then
		local line_object = self._line_object

		LineObject.reset(line_object)
		LineObject.dispatch(self._world, line_object)
	end
end

local DO_RELOAD = true

ImguiPhysgun.update = function (self, t, dt, is_open)
	if DO_RELOAD then
		DO_RELOAD = self:init()
	end
end

ImguiPhysgun.draw = function (self, is_open, t, dt)
	if not self._delayed_initialization_done then
		self:_delayed_initialization()
	end

	local do_close = Imgui.begin_window("Physgun")
	local line_object = self._line_object
	local pos, rot = self:get_player_pos_rot()

	if pos then
		local dir = QQ.forward(rot)
		local raycast_length = 30
		local hit, hit_pos, hit_distance, hit_normal, hit_actor = PhysicsWorld.raycast(self._physics_world, pos, dir, raycast_length, "closest", "collision_filter", "filter_in_line_of_sight_no_players_no_enemies")

		if hit and not self._physgun_unit then
			LineObject.add_circle(line_object, Color(255, 255, 0, 0), hit_pos, 0.1, hit_normal)
			LineObject.add_line(line_object, Color(255, 255, 0, 0), hit_pos, hit_pos + 0.1 * hit_normal)
			Actor.debug_draw(hit_actor, line_object, Color(255, 255, 0, 0))

			if input_get("delete_unit") then
				local unit = Actor.unit(hit_actor)

				if unit == self._physgun_unit then
					self:grab_end()
				end

				World.destroy_unit(self._world, unit)

				hit_actor = nil
			elseif input_get("spawn_cylinder") then
				-- Nothing
			end
		end

		local info_unit = self._physgun_unit or hit_actor and Actor.unit(hit_actor)

		if info_unit then
			self:show_unit_info(info_unit)
		end

		self:do_grab(dt, pos, rot, hit_actor, hit_pos)
	else
		Imgui.text("Could not raycast.")

		if self._physgun_unit then
			self:grab_end()
		end
	end

	LineObject.dispatch(self._world, line_object)
	LineObject.reset(line_object)
	Imgui.end_window()

	return do_close
end
