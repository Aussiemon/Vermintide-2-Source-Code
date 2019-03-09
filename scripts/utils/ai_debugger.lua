require("scripts/utils/script_gui")
require("scripts/utils/draw_ai_behavior")

script_data.ai_debugger_freeflight_only = script_data.ai_debugger_freeflight_only or Development.parameter("ai_debugger_freeflight_only")
local font_size = 26
local font_size_medium = 22
local font_size_blackboard = 16
local font = "gw_arial_32"
local font_mtrl = "materials/fonts/" .. font

local function table_as_sorted_string_arrays(source, key_dest, value_dest)
	local count = 0

	for key, value in pairs(source) do
		count = count + 1
		key_dest[count] = tostring(key)
	end

	table.sort(key_dest)

	for i = 1, count, 1 do
		local key = key_dest[i]
		value_dest[i] = source[key]
	end

	return count
end

AIDebugger = class(AIDebugger)

AIDebugger.init = function (self, world, nav_world, group_blackboard, is_server, free_flight_manager)
	self.free_flight_manager = free_flight_manager
	self.is_server = is_server
	self.world = world
	self.nav_world = nav_world
	self.group_blackboard = group_blackboard
	self.world_gui = World.create_world_gui(world, Matrix4x4.identity(), 1, 1, "immediate", "material", "materials/fonts/gw_fonts")
	self.screen_gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")
	self.show_navmesh = false
	self.show_extensions = false
	self.cycle_info = 0
	self.show_slots = false
	self.follow_active = false
	self.show_behavior_tree = false
	self.hint_time_when_key_handle_visible = 0
end

AIDebugger.lazy_create_drawer = function (self)
	if self.drawer then
		return
	end

	self.drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "AIDebugger"
	})
end

AIDebugger.destroy = function (self)
	return
end

AIDebugger.update = function (self, t, dt)
	self:lazy_create_drawer()

	if Unit.alive(script_data.debug_unit) then
		local unit = script_data.debug_unit
		local ai_extension = ScriptUnit.has_extension(unit, "ai_system")
		local breed = ai_extension and ai_extension._breed

		if breed then
			local blackboard = BLACKBOARDS[unit]

			if blackboard.mode then
				Debug.text("debug_unit = %s, mode=%s, phase=%s", breed.name, tostring(blackboard.mode), tostring(blackboard.phase))
			else
				Debug.text("script_data.debug_unit = %s", breed.name)
			end
		else
			Debug.text("script_data.debug_unit = %s", tostring(unit))
		end
	end

	local in_free_flight = self.free_flight_manager:active("global")

	if in_free_flight then
		local input_service = self.free_flight_manager.input_manager:get_service("FreeFlight")

		self:update_selection(input_service, dt)
		self:update_mouse_input(input_service)
		self:draw_reticule()
		self:draw_hint(t)

		if self.follow_active and Unit.alive(self.active_unit) then
			local viewport = ScriptWorld.global_free_flight_viewport(self.world)
			local cam = ScriptViewport.camera(viewport)
			local cm = Unit.local_pose(self.active_unit, 0)
			local pos = Matrix4x4.translation(cm)
			local forward = Matrix4x4.forward(cm)
			local new_pos = pos - forward * 4 + Vector3.up() * 3

			Matrix4x4.set_translation(cm, new_pos)

			local direction = Vector3.normalize((pos + Vector3.up()) - new_pos)
			local rotation = Quaternion.look(direction)

			Matrix4x4.set_rotation(cm, rotation)
			ScriptCamera.set_local_pose(cam, cm)
		end

		self:update_ingame_selection(true)
	else
		self:update_ingame_selection(false)

		self.hint_time_when_key_handle_visible = t
		self.key_handler_visible = nil

		if script_data.ai_debugger_freeflight_only then
			return
		end
	end

	if DebugKeyHandler.key_pressed("k", "show ai navmesh", "ai debugger", nil, "FreeFlight") then
		self.show_navmesh = not self.show_navmesh
	end

	if DebugKeyHandler.key_pressed("l", "show ai slots", "ai debugger", nil, "FreeFlight") then
		self.show_slots = not self.show_slots
	end

	if DebugKeyHandler.key_pressed("x", "clear quickdraw", "ai debugger", nil, "FreeFlight") then
		QuickDrawerStay:reset()
		Debug.reset_sticky_world_texts()
	end

	if DebugKeyHandler.key_pressed("j", "kill all but selected AI", "ai", "left shift") then
		Managers.state.conflict:destroy_close_units(self.active_unit, 262144)
	elseif DebugKeyHandler.key_pressed("j", "kill selected AI", "ai") then
		local kill_unit = self.active_unit

		if not AiUtils.unit_alive(kill_unit) and self:closest_unit_in_aim_dir(in_free_flight) then
			kill_unit = self.hot_unit
		end

		if Unit.alive(kill_unit) then
			local health_extension = ScriptUnit.has_extension(kill_unit, "health_system")

			if health_extension then
				if health_extension:is_alive() then
					health_extension:die("forced")
				end
			else
				local blackboard = BLACKBOARDS[kill_unit]

				Managers.state.conflict:destroy_unit(kill_unit, blackboard, "debug_destroy")
			end
		end
	end

	if Unit.alive(self.hot_unit) then
		self:draw_hot_unit()
	end

	if Unit.alive(self.active_unit) then
		self:draw_active_unit(t)

		if DebugKeyHandler.key_pressed("comma", "go to unit", "ai debugger", nil, "FreeFlight") then
			self.follow_active = not self.follow_active
		end

		if DebugKeyHandler.key_pressed("m", "animation log", "ai debugger", "left shift") then
			local enabled = not not not Unit.get_data(self.active_unit, "ai_debugger", "logging_enabled")

			print("animation log enabled " .. tostring(enabled))
			Unit.set_data(self.active_unit, "ai_debugger", "logging_enabled", enabled)
			Unit.set_animation_logging(self.active_unit, enabled)
		end

		if DebugKeyHandler.key_pressed("m", "show blackboard", "ai debugger", "left ctrl") then
			self.cycle_info = (self.cycle_info + 1) % 3
			local c = self.cycle_info

			if c == 1 then
				self.show_blackboard = true
			elseif c == 2 then
				self.show_blackboard = false
				self.show_extensions = true
			elseif c == 0 then
				self.show_extensions = false
			end
		end

		local platform = PLATFORM
		local toggle_bt_pressed = nil

		if platform == "ps4" or platform == "xb1" then
			toggle_bt_pressed = DebugKeyHandler.key_pressed("show_behaviour", "show behaviour graph", "ai debugger")
		else
			toggle_bt_pressed = DebugKeyHandler.key_pressed("b", "show behaviour graph", "ai debugger", "left ctrl")
		end

		if toggle_bt_pressed then
			self.show_behavior_tree = not self.show_behavior_tree
			script_data.hide_boss_health_ui = self.show_behavior_tree
		end

		local active_unit = self.active_unit

		if Unit.alive(active_unit) then
			self:draw_blackboard(active_unit)
			self:draw_extensions(active_unit)
			self:draw_behavior_tree(active_unit, t, dt)
		end
	end

	if DebugKeyHandler.key_pressed("j", "edit_ai_utility", "ai", "left ctrl") then
		if self._edit_ai_utility == nil then
			self._edit_ai_utility = EditAiUtility:new(self.world)
		end

		if not self.show_edit_ai_utility then
			self._edit_ai_utility:activate()
		else
			self._edit_ai_utility:deactivate()
		end

		self.show_edit_ai_utility = not self.show_edit_ai_utility
	end

	if self.show_edit_ai_utility then
		local blackboard = Unit.alive(self.active_unit) and BLACKBOARDS[self.active_unit]

		self._edit_ai_utility:update(self.active_unit, t, dt, Managers.input:get_service("Debug"), blackboard)
	end

	if script_data.debug_ai_pacing then
		self:debug_pacing(t, dt)
	end

	if self.is_server and script_data.debug_player_intensity then
		self:debug_player_intensity(t, dt)
	end

	if DebugKeyHandler.key_pressed("c", "spawn bot player", "ai debugger", nil, "FreeFlight") then
	end

	if self._fake_players then
		for _, box_position in ipairs(self._fake_players) do
			local position = Vector3Box.unbox(box_position)

			self.drawer:sphere(position, 0.5, Color(255, 255, 0, 0))
		end
	end
end

AIDebugger.perlin_path = function (self, t, x, y, xsize, ysize)
	local resx, resy = Application.resolution()
	local layer = 500
	local line_width = 3
	local colors = {
		Color(255, 30, 240, 70),
		Color(255, 130, 40, 170),
		Color(255, 130, 240, 70),
		Color(255, 0, 40, 170),
		Color(255, 230, 40, 230)
	}
	local gui = self.screen_gui
	local seed = 60337
	local oktaves = PerlinPath.make_perlin_path(15, 15, 1, seed)
	local mul_with = PerlinPath.normalize_path(oktaves[1], 0.5 + 0.5 * math.sin(t * 0.1))
	local x1 = x * resx
	local y1 = y * resy
	local x2 = resx * (x + xsize)
	local y2 = resy * (y + ysize)

	ScriptGUI.icrect(gui, resx, resy, x1, y1, x2, y2, layer - 1, Color(200, 20, 20, 20))

	for i = 1, #oktaves, 1 do
		local octave = oktaves[i]
		local p1 = Vector3(x + octave[0][1] * xsize, y + (1 - octave[0][2] * mul_with) * ysize, 0)
		local p2 = nil

		for j = 1, #octave, 1 do
			local p = octave[j]
			p2 = Vector3(x + p[1] * xsize, y + (1 - p[2] * mul_with) * ysize, 0)

			ScriptGUI.hud_iline(gui, resx, resy, p1, p2, layer, line_width, colors[i % 5 + 1])

			p1 = p2
		end
	end
end

AIDebugger.update_selection = function (self, input, dt)
	self:mouse_raycast(input)

	if not Unit.alive(self.active_unit) then
		self.active_unit = nil
	end

	local mouse_released = input:get("action_one")

	if mouse_released then
		self.active_unit = self.hot_unit
		script_data.debug_unit = self.active_unit
	end

	if DebugKeyHandler.key_pressed("period", "select next bot", "ai debugger", nil, "FreeFlight") then
		local units = Managers.state.entity:get_entities("AISimpleExtension")
		self.active_unit = next(units, self.active_unit)
	end
end

AIDebugger.update_ingame_selection = function (self, in_free_flight)
	if not Unit.alive(self.active_unit) then
		self.active_unit = nil
	end

	local select_target = DebugKeyHandler.key_pressed("right_thumb_pressed", "select target", "ai")

	if (select_target or DebugKeyHandler.key_pressed("v", "select bot", "ai debugger")) and self:closest_unit_in_aim_dir(in_free_flight) then
		if Unit.alive(self.active_unit) and script_data.anim_debug_ai_debug_target then
			Unit.set_animation_logging(self.active_unit, false)
		end

		self.active_unit = self.hot_unit
		script_data.debug_unit = self.active_unit

		if self.active_unit and script_data.anim_debug_ai_debug_target then
			Unit.set_animation_logging(self.active_unit, true)
			print("[AIDebugger] NEW TARGET!", self.active_unit)
		end
	end
end

AIDebugger.closest_unit_in_aim_dir = function (self, in_free_flight)
	if in_free_flight then
		return true
	end

	local player_manager = Managers.player
	local player = player_manager:player_from_peer_id(Network.peer_id())
	local player_unit = player.player_unit

	if not player_unit then
		return
	end

	local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")
	local first_person_unit = first_person_extension:get_first_person_unit()
	local camera_position = first_person_extension:current_position()
	local camera_rotation = first_person_extension:current_rotation()
	local camera_direction = Quaternion.forward(camera_rotation)
	local min_dot = 999
	local best_unit = nil
	local units = {}
	local entity_manager = Managers.state.entity
	local ai_units = Managers.state.entity:system("ai_system").unit_extension_data
	local player_bots = Managers.state.entity:get_entities("PlayerBotBase")

	table.merge(units, ai_units)

	if not script_data.ignore_bots_for_debug_selection then
		table.merge(units, player_bots)
	end

	for unit, _ in pairs(units) do
		if Unit.alive(unit) then
			local v1 = camera_direction
			local p1 = camera_position
			local p2 = POSITION_LOOKUP[unit] + Vector3(0, 0, 1)
			local v2 = Vector3.normalize(p1 - p2)
			local dot = Vector3.dot(v1, v2)

			if dot <= min_dot and unit ~= self.active_unit then
				print("UNIT", unit)

				min_dot = dot
				best_unit = unit
			end
		end
	end

	if best_unit then
		self.hot_unit = best_unit

		return true
	end
end

AIDebugger.mouse_raycast = function (self, input)
	local data = self.free_flight_manager.data.global
	local world = Managers.world:world(data.viewport_world_name)
	local physics_world = World.get_data(world, "physics_world")
	local viewport = ScriptWorld.global_free_flight_viewport(world)
	local camera = data.frustum_freeze_camera or ScriptViewport.camera(viewport)
	local mouse = input:get("cursor")
	local position = Camera.screen_to_world(camera, Vector3(mouse.x, mouse.y, 0), 0)
	local direction = Camera.screen_to_world(camera, Vector3(mouse.x, mouse.y, 0), 1) - position
	local raycast_dir = Vector3.normalize(direction)
	local hit, hit_position, distance, normal, actor = PhysicsWorld.immediate_raycast(physics_world, position, raycast_dir, 100, "closest", "collision_filter", "filter_character_trigger")
	self.hot_unit = nil
	self.hot_actor = nil

	if hit and actor then
		local unit = Actor.unit(actor)
		local breed = Unit.get_data(unit, "breed")
		local player_manager = Managers.player
		local is_bot = player_manager:is_player_unit(unit) and player_manager:owner(unit).bot_player

		if breed or is_bot then
			self.hot_unit = unit
			self.hot_actor = actor
		end
	end
end

local damage_direction = {
	z = -1,
	x = 0,
	y = 0
}

AIDebugger.update_mouse_input = function (self, input)
	if not Unit.alive(self.hot_unit) then
		return
	end

	local mouse_released = input:get("action_two")

	if mouse_released then
		local breed = Unit.get_data(self.hot_unit, "breed")

		DamageUtils.debug_deal_damage(self.hot_unit, "basic_debug_damage_ai")
	end
end

AIDebugger.draw_hot_unit = function (self)
	local position = Unit.local_position(self.hot_unit, 0)

	self.drawer:sphere(position + Vector3.up() * 2, 0.15, Color(255, 255, 100, 0))
end

AIDebugger.draw_active_unit = function (self, t)
	local drawer = self.drawer
	local position = Unit.local_position(self.active_unit, 0)

	drawer:sphere(position + Vector3.up() * 2, 0.1, Color(255, 255, 255, 0))
	self:draw_nearby_navmesh(self.active_unit)
end

local color_table = {}

for i = 1, 25, 1 do
	color_table[i] = math.random(1, 15)
end

AIDebugger.draw_nearby_navmesh = function (self, ai_unit)
	if not self.show_navmesh then
		return
	end

	local drawer = self.drawer
	local position = POSITION_LOOKUP[ai_unit]
	local offset = Vector3(0, 0, 0.2)
	self._line_object = self._line_object or World.create_line_object(self.world, false)

	LineObject.reset(self._line_object)

	local nav_world = self.nav_world
	local triangle = GwNavTraversal.get_seed_triangle(nav_world, position)

	if triangle == nil then
		return
	end

	local triangles = {
		triangle
	}
	local num_triangles = 1
	local i = 0

	while num_triangles > i do
		i = i + 1
		triangle = triangles[i]
		local p1, p2, p3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)
		local triangle_center = p1 + p2 + p3
		local table_index = math.ceil((triangle_center.x + triangle_center.y) % 24 + 1)
		local green = color_table[table_index] * 10

		Gui.triangle(self.world_gui, p1 + offset, p2 + offset, p3 + offset, 0, Color(150, 0, green, 255))
		LineObject.add_line(self._line_object, Color(0, 0, 200), p1 + offset, p2 + offset)
		LineObject.add_line(self._line_object, Color(0, 0, 200), p1 + offset, p3 + offset)
		LineObject.add_line(self._line_object, Color(0, 0, 200), p2 + offset, p3 + offset)

		local neighbors = {
			GwNavTraversal.get_neighboring_triangles(triangle)
		}

		for j = 1, #neighbors, 1 do
			local neighbor = neighbors[j]
			local is_in_list_already = false

			for k = 1, num_triangles, 1 do
				local triangle2 = triangles[k]

				if GwNavTraversal.are_triangles_equal(neighbor, triangle2) then
					is_in_list_already = true

					break
				end
			end

			if not is_in_list_already then
				local p2_1, p2_2, p2_3 = GwNavTraversal.get_triangle_vertices(nav_world, triangle)

				if Vector3.distance((p2_1 + p2_2 + p2_3) * 0.33, position) < 5 then
					num_triangles = num_triangles + 1
					triangles[num_triangles] = neighbor
				end
			end
		end
	end

	LineObject.dispatch(self.world, self._line_object)
end

AIDebugger.draw_blackboard = function (self, ai_unit)
	if not self.show_blackboard then
		return
	end

	local gui = self.screen_gui
	local blackboard = BLACKBOARDS[ai_unit]
	local key_dest_root = {}
	local value_dest_root = {}
	local key_dest_subtree = {}
	local value_dest_subtree = {}
	local count_root = table_as_sorted_string_arrays(blackboard, key_dest_root, value_dest_root)
	local res_x, res_y = Application.resolution()
	local start_y = res_y - 100
	local pos = Vector3(200, start_y, 150)
	local value_offset = Vector3(200, 0, 0)
	local indent_offset = Vector3(30, 0, 0)
	local columns = 1
	local header = string.format("Blackboard [ %s ]  @  %s", blackboard.breed.name, tostring(POSITION_LOOKUP[ai_unit]))

	Gui.text(gui, header, font_mtrl, font_size, font, pos, Color(255, 255, 255, 255))

	pos.y = pos.y - font_size

	for i = 1, count_root, 1 do
		local key = key_dest_root[i]
		local value = value_dest_root[i]
		pos.y = pos.y - font_size_blackboard

		if pos.y < 100 then
			pos.y = start_y - font_size - font_size_blackboard
			pos.x = pos.x + 500
			columns = columns + 1
		end

		Gui.text(gui, key, font_mtrl, font_size_blackboard, font, pos, Color(255, 255, 255, 255))

		if type(value) == "table" then
			local count_subtree = table_as_sorted_string_arrays(value, key_dest_subtree, value_dest_subtree)

			if count_subtree == 0 then
				Gui.text(gui, "[empty table]", font_mtrl, font_size_blackboard, font, pos + value_offset, Color(255, 100, 100, 100))
			elseif value.name ~= nil then
				pos.y = pos.y - font_size_blackboard

				Gui.text(gui, "name", font_mtrl, font_size_blackboard, font, pos + indent_offset, Color(255, 255, 255, 255))
				Gui.text(gui, tostring(value.name), font_mtrl, font_size_blackboard, font, pos + value_offset, Color(255, 255, 255, 0))

				pos.y = pos.y - font_size_blackboard

				Gui.text(gui, "[hidden fields]", font_mtrl, font_size_blackboard, font, pos + indent_offset, Color(255, 100, 100, 100))
				Gui.text(gui, tostring(count_subtree - 1), font_mtrl, font_size_blackboard, font, pos + value_offset, Color(255, 100, 100, 0))
			elseif key:find("_extension") ~= nil then
				pos.y = pos.y - font_size_blackboard

				Gui.text(gui, "[hidden fields]", font_mtrl, font_size_blackboard, font, pos + indent_offset, Color(255, 100, 100, 100))
				Gui.text(gui, tostring(count_subtree - 1), font_mtrl, font_size_blackboard, font, pos + value_offset, Color(255, 100, 100, 0))
			else
				for j = 1, count_subtree, 1 do
					local key_subtree = key_dest_subtree[j]
					local value_subtree = value_dest_subtree[j]

					if type(value_subtree) ~= "table" then
						pos.y = pos.y - font_size_blackboard

						Gui.text(gui, key_subtree, font_mtrl, font_size_blackboard, font, pos + indent_offset, Color(255, 255, 255, 255))
						Gui.text(gui, tostring(value_subtree), font_mtrl, font_size_blackboard, font, pos + value_offset, Color(255, 255, 255, 0))
					else
						pos.y = pos.y - font_size_blackboard

						Gui.text(gui, key_subtree, font_mtrl, font_size_blackboard, font, pos + indent_offset, Color(255, 255, 255, 255))
						Gui.text(gui, "[table]", font_mtrl, font_size_blackboard, font, pos + value_offset, Color(255, 255, 255, 0))
					end
				end
			end

			table.clear_array(key_dest_subtree, count_subtree)
			table.clear_array(value_dest_subtree, count_subtree)
		else
			Gui.text(gui, tostring(value), font_mtrl, font_size_blackboard, font, pos + value_offset, Color(255, 255, 255, 0))
		end
	end

	pos.y = pos.y - font_size_blackboard

	if columns == 1 then
		Gui.rect(gui, Vector3(150, pos.y, 100), Vector2(pos.x + 400, start_y - pos.y + font_size_blackboard * 3), Color(240, 25, 50, 25))
	else
		Gui.rect(gui, Vector3(150, 0, 100), Vector2(pos.x + 400, start_y + 50), Color(240, 25, 50, 25))
	end
end

AIDebugger.draw_behavior_tree = function (self, ai_unit, t, dt)
	if not self.show_behavior_tree then
		return
	end

	self.tree_x = self.tree_x or 0.45
	self.tree_y = self.tree_y or 0
	local ai_extension = ScriptUnit.has_extension(ai_unit, "ai_system")

	if ai_extension then
		local bt = ai_extension:brain():bt()
		local root_node = bt:root()

		DrawAiBehaviour.tree_width(self.screen_gui, root_node)

		local extra_info = nil
		local group_extension = ScriptUnit.has_extension(ai_unit, "ai_group_system")

		if group_extension and group_extension.template then
			local group_template = AIGroupTemplates[group_extension.template]
			extra_info = group_template.BT_debug and group_template.BT_debug(group_extension.group)
		end

		local blackboard = BLACKBOARDS[ai_unit]

		DrawAiBehaviour.draw_tree(bt, self.screen_gui, root_node, blackboard, 1, t, dt, self.tree_x, self.tree_y, nil, extra_info)

		local right_shoulder_held = DebugKeyHandler.key_pressed("right_shoulder_held", "pan behaviour graph", "ai debugger")
		local mouse_middle_held = DebugKeyHandler.key_pressed("mouse_middle_held", "pan behaviour graph", "ai debugger")
		local pan_mouse_vertical = DebugKeyHandler.key_pressed("mouse_middle_held", "pan behaviour graph vertical", "ai debugger", "left ctrl")

		if mouse_middle_held or pan_mouse_vertical then
			local input_service = self.free_flight_manager.input_manager:get_service("Debug")
			local look = input_service:get("look")
			self.tree_x = self.tree_x - look.x * 0.001

			if pan_mouse_vertical then
				self.tree_y = self.tree_y - look.y * 0.001
			end
		elseif right_shoulder_held then
			local input_service = self.free_flight_manager.input_manager:get_service("Debug")
			local look = input_service:get("look_raw")
			self.tree_x = self.tree_x - look.x * 0.1
			self.tree_y = self.tree_y - look.y * 0.1
		end

		if DebugKeyHandler.key_pressed("mouse_middle_held", "pan reset behaviour graph", "ai debugger", "left shift") then
			self.tree_x = 0.45
			self.tree_y = 0
		end
	end
end

AIDebugger.draw_reticule = function (self)
	return

	local crosshair = "crosshair_texture_1"
	local atlas_name = "hud_assets"

	if rawget(_G, atlas_name)[crosshair] then
		local resolution_width, resolution_height = Gui.resolution()
		local color = (self.hot_unit and Color(255, 255, 0, 0)) or Color(255, 255, 255, 255)
		local material, uv00, uv11, size = HUDHelper.atlas_material(atlas_name, crosshair)
		local scale = 1

		Gui.bitmap_uv(self.screen_gui, material, Vector2(uv00[1], uv00[2]), Vector2(uv11[1], uv11[2]), Vector3((resolution_width - scale * size.x) / 2, (resolution_height - scale * size.y) / 2, 0), scale * size, color)
	end
end

AIDebugger.debug_player_intensity = function (self, t, dt)
	local xcol = {
		Color(200, 160, 145, 0),
		Color(200, 90, 150, 170),
		Color(200, 10, 200, 100),
		Color(200, 190, 50, 190)
	}
	local gui = self.screen_gui
	local res_x, res_y = Application.resolution()
	local players = Managers.player:human_players()
	local bar_width = 0.15
	local bar_height = 0.02
	local wedge = 0.0025
	local win_x = 1 - (bar_width + wedge)
	local win_y = 0.15
	local row = win_y
	local conflict_director = Managers.state.conflict
	local pacing = conflict_director.pacing
	local sum_intensity, player_intensity = pacing:get_intensity()

	for k = 1, #player_intensity, 1 do
		local int = player_intensity[k] * 0.01
		local x1 = win_x
		local y1 = row + bar_height
		local x2 = win_x + bar_width * int
		local y2 = row

		ScriptGUI.irect(gui, res_x, res_y, x1, y1, win_x + bar_width, y2, 1, Color(100, 10, 10, 10))
		ScriptGUI.irect(gui, res_x, res_y, x1, y1, x2, y2, 2, xcol[k])

		row = row + bar_height + wedge
	end

	ScriptGUI.itext(gui, res_x, res_y, "[Player Intensity]", font_mtrl, font_size, font, win_x, win_y, 3, Color(255, 237, 237, 152))

	row = row + bar_height * 1

	ScriptGUI.itext(gui, res_x, res_y, "[Total Intensity]", font_mtrl, font_size, font, win_x, row + bar_height * 0.75, 3, Color(255, 237, 237, 152))

	row = row + bar_height * 1

	ScriptGUI.irect(gui, res_x, res_y, win_x, row + bar_height, win_x + bar_width, row, 1, Color(100, 90, 10, 10))
	ScriptGUI.irect(gui, res_x, res_y, win_x, row + bar_height, win_x + bar_width * sum_intensity * 0.01, row, 2, Color(200, 130, 10, 10))

	local decay_text = ""
	local frozen = conflict_director:intensity_decay_frozen()

	if frozen then
		decay_text = string.format("decay delay frozen: %.1f", math.clamp(conflict_director.frozen_intensity_decay_until - t, 0, 100))
	elseif pacing:ignore_intensity_decay_delay() then
		decay_text = "decay delay: ignored"
	else
		local player = Managers.player:local_player(1)
		local status_extension = ScriptUnit.has_extension(player.player_unit, "status_system")

		if status_extension then
			decay_text = "decay delay: " .. string.format("[%.1f] ", math.clamp(status_extension.intensity_decay_delay, 0, 100))
		end
	end

	row = row + bar_height * 1.5
	local small_font_size = 22

	ScriptGUI.itext(gui, res_x, res_y, decay_text, font_mtrl, small_font_size, font, win_x, row + bar_height * 0.75, 3, Color(255, 200, 200, 32))
end

AIDebugger.debug_pacing = function (self, t, dt)
	local gui = self.screen_gui
	local cm = Managers.state.conflict
	local res_x, res_y = Application.resolution()
	local text_height = 0.02
	local width = 0.3
	local height = 0.2
	local wedge = 0.0025
	local win_x = 0.45
	local win_y = 0.01
	local row = win_y
	local info = CurrentPacing.name or "default"
	local nx = ScriptGUI.itext_next_xy(gui, res_x, res_y, "Pacing: ", font_mtrl, font_size, font, win_x + wedge, row + text_height, 3, Color(255, 237, 237, 152))
	nx = ScriptGUI.itext_next_xy(gui, res_x, res_y, info, font_mtrl, font_size, font, nx, row + text_height, 3, Color(255, 137, 237, 137))
	nx = ScriptGUI.itext_next_xy(gui, res_x, res_y, "Conflict setting: ", font_mtrl, font_size, font, nx, row + text_height, 3, Color(255, 237, 237, 152))
	nx = ScriptGUI.itext_next_xy(gui, res_x, res_y, tostring(cm.current_conflict_settings), font_mtrl, font_size, font, nx, row + text_height, 3, Color(255, 137, 237, 137))
	row = row + 0.03
	local text, spawning_text = nil
	local state_name, state_start_time, threat_population, specials_population, horde_population, end_time = cm.pacing:get_pacing_data()
	local roamers = (threat_population > 0 and "[Roamers]") or "[NO Roamers]"
	local specials = (horde_population > 0 and "[Specials]") or "[NO Specials]"
	local horde = (horde_population > 0 and "[Hordes]") or "[NO Hordes]"

	if end_time then
		local count_down = math.clamp(end_time - t, 0, 999999)
		text = string.format("State: %s time left: %.1f", state_name, count_down)
		spawning_text = string.format("%s%s%s", roamers, specials, horde)
	else
		text = string.format("State: %s runtime: %.1f", state_name, t - state_start_time)
		spawning_text = string.format("%s%s%s", roamers, specials, horde)
	end

	ScriptGUI.itext(gui, res_x, res_y, text, font_mtrl, font_size_medium, font, win_x + wedge, row + text_height, 3, Color(255, 237, 237, 152))

	row = row + 0.03

	ScriptGUI.itext(gui, res_x, res_y, spawning_text, font_mtrl, font_size_medium, font, win_x + wedge, row + text_height, 3, Color(255, 137, 237, 152))

	row = row + 0.03
	local s1 = nil

	if script_data.ai_horde_spawning_disabled then
		s1 = string.format("Horde spawning is disabled")
	else
		local next_horde_time, hordes, multiple_horde_count = cm:get_horde_data()

		if #hordes > 0 then
			s1 = string.format("Number of hordes active: %d  horde size:%d", #hordes, cm:horde_size())
		elseif horde_population > 0 then
			if next_horde_time then
				s1 = string.format("Next horde in: %.1fs horde size:%d", next_horde_time - t, cm:horde_size())
			else
				s1 = "Next horde in: N/A"
			end
		else
			s1 = string.format("No horde will spawn during this state")
		end

		if multiple_horde_count then
			local textmc = string.format("Horde waves left: %d", multiple_horde_count)

			ScriptGUI.itext(gui, res_x, res_y, textmc, font_mtrl, font_size_medium, font, win_x + wedge, row + text_height, 3, Color(255, 237, 237, 152))

			row = row + 0.03
		end
	end

	ScriptGUI.itext(gui, res_x, res_y, s1, font_mtrl, font_size_medium, font, win_x + wedge, row + text_height, 3, Color(255, 237, 237, 152))

	row = row + 0.03

	if cm.players_speeding_dist then
		local max_dist = CurrentPacing.relax_rushing_distance
		local s = string.format("Players rushing dist: %d / %d", cm.players_speeding_dist, max_dist)

		ScriptGUI.itext(gui, res_x, res_y, s, font_mtrl, font_size_medium, font, win_x + wedge, row + text_height, 3, Color(255, 237, 237, 152))

		row = row + 0.03
	end

	ScriptGUI.irect(gui, res_x, res_y, win_x, win_y, win_x + width, row, 2, Color(100, 10, 10, 10))
end

local hint_shown = false

AIDebugger.draw_hint = function (self, t)
	if script_data and script_data.disable_debug_draw then
		return
	end

	if hint_shown then
		return
	end

	local gui = self.screen_gui
	local res_x, res_y = Application.resolution()

	if script_data.debug_key_handler_visible then
		self.hint_time_when_key_handle_visible = t

		return
	end

	local anim_t = t - self.hint_time_when_key_handle_visible

	if anim_t > math.pi * 2 then
		hint_shown = true

		return
	end

	local opacity = math.min(1, math.sin(anim_t * 0.5) * 3) * 255
	local msg = "Hint: you can show ai debugger shortcuts by enabling 'debug_key_handler_visible' in the debug menu"
	local msg_min, msg_max = Gui.text_extents(gui, msg, font_mtrl, font_size)
	local msg_width = msg_max.x - msg_min.x
	local x = res_x / 2 - msg_width / 2

	Gui.text(gui, msg, font_mtrl, font_size, font, Vector3(x, 20, 150), Color(opacity, 255, 255, 255))
	Gui.rect(gui, Vector3(x - 20, 0, 100), Vector2(msg_width + 40, 50), Color(opacity * 0.75, 25, 50, 25))
end

AIDebugger.create_fake_players = function (self)
	local player_manager = Managers.player
	local player = player_manager:player_from_peer_id(Network.peer_id())
	local player_unit = player.player_unit
	local center_position = POSITION_LOOKUP[player_unit]
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._fake_players = {
		Vector3Box(center_position)
	}

	for i = 2, 4, 1 do
		self._fake_players[i] = Vector3Box(LocomotionUtils.new_random_goal(nav_world, nil, center_position, 5, 20, 10))
	end

	return self._fake_players
end

AIDebugger.fake_players = function (self)
	return self._fake_players
end

AIDebugger.draw_extensions = function (self, ai_unit)
	if not self.show_extensions then
		return
	end

	local gui = self.screen_gui
	local blackboard = BLACKBOARDS[ai_unit]
	local res_x, res_y = Application.resolution()
	local start_y = res_y - 120
	local pos = Vector3(200, start_y, 150)
	local columns = 1
	local header = string.format("Extensions for %s", blackboard.breed.name)

	Gui.text(gui, header, font_mtrl, font_size, font, pos, Color(255, 255, 255, 255))

	pos.y = pos.y - font_size
	local unit_extensions = ScriptUnit.extensions(ai_unit)

	for system_name, _ in pairs(unit_extensions) do
		pos.y = pos.y - font_size_blackboard

		if pos.y < 100 then
			pos.y = start_y - font_size - font_size_blackboard
			pos.x = pos.x + 500
			columns = columns + 1
		end

		Gui.text(gui, system_name, font_mtrl, font_size_blackboard, font, pos, Color(255, 255, 255, 255))
	end

	pos.y = pos.y - font_size_blackboard

	if columns == 1 then
		Gui.rect(gui, Vector3(150, pos.y, 100), Vector2(pos.x + 400, start_y - pos.y + font_size_blackboard * 3), Color(240, 25, 50, 25))
	else
		Gui.rect(gui, Vector3(150, 0, 100), Vector2(pos.x + 400, start_y + 50), Color(240, 25, 50, 25))
	end
end

return
