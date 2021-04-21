-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/managers/game_mode/mechanisms/deus_layout_base_graph")
require("scripts/managers/game_mode/mechanisms/deus_base_graph_generator")
require("scripts/managers/game_mode/mechanisms/deus_populate_graph")
require("scripts/settings/dlcs/morris/deus_default_graph_settings")

DeusDebugMapUI = class(DeusDebugMapUI)
DeusDebugDrawMapSettings = DeusDebugDrawMapSettings or {}
local color_map_for_label = {
	[0] = ColorBox(Colors.get("black")),
	ColorBox(Colors.get("red")),
	ColorBox(Colors.get("green")),
	ColorBox(Colors.get("blue")),
	ColorBox(Colors.get("dark_cyan")),
	ColorBox(Colors.get("purple")),
	ColorBox(Colors.get("orange"))
}
local start_x = 0.2
local start_y = 0.2
local total_width = 0.7
local total_height = 0.7

DeusDebugMapUI.init = function (self, parent, ingame_ui_context)
	self._world = ingame_ui_context.world_manager:world("level_world")
	self._gui = World.create_screen_gui(self._world, "immediate", "material", "materials/fonts/gw_fonts")
end

DeusDebugMapUI.destroy = function (self)
	World.destroy_gui(self._world, self._gui)

	self._gui = nil
end

DeusDebugMapUI.update = function (self, dt, t)
	if not script_data.deus_debug_draw_map then
		self._current_seed = nil

		return
	end

	local width, height = Gui.resolution()

	Gui.rect(self._gui, Vector2(0, 0), Vector2(width, height), Color(255, 255, 255, 255))

	local mechanism = Managers.mechanism:game_mechanism()
	local deus_run_controller = mechanism and mechanism:get_deus_run_controller()

	if deus_run_controller then
		self:_draw_final_graph(deus_run_controller:get_graph_data())
	elseif DeusDebugDrawMapSettings.base_graph then
		self:_draw_base_graph(DeusDebugDrawMapSettings.base_graph)
	elseif DeusDebugDrawMapSettings.final_graph then
		self:_draw_final_graph(DeusDebugDrawMapSettings.final_graph)
	end
end

DeusDebugMapUI._draw_base_graph = function (self, graph, dt, t)
	local font = "materials/fonts/arial"
	local font_material = "arial"
	local font_size = 10
	local width, height = Gui.resolution()
	local min_x = width * start_x
	local min_y = height * start_y
	local layout_width = width * total_width
	local layout_height = height * total_height
	local gui = self._gui

	self:_draw_edges(graph)

	for key, node in pairs(graph) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-34, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 114-119, warpins: 3 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 121-132, warpins: 2 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 134-153, warpins: 2 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 155-191, warpins: 2 ---
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 193-222, warpins: 2 ---
		local pos_x = min_x + layout_width * graph[key].layout_x
		local pos_y = min_y + layout_height * graph[key].layout_y

		if node.type == "SIGNATURE" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-49, warpins: 1 ---
			slot21 = Gui.rect
			slot22 = gui
			slot23 = Vector2(pos_x - 10, pos_y - 10)
			slot24 = Vector2(20, 20)
			slot25 = color_map_for_label

			if not node.label then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 50-50, warpins: 1 ---
				slot26 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 51-56, warpins: 2 ---
			slot21(slot22, slot23, slot24, slot25[slot26]:unbox())
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-59, warpins: 1 ---
			if node.type == "TRAVEL" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 60-85, warpins: 1 ---
				local axis_y_p1 = Vector3(pos_x + 10, 0, pos_y - 10)
				local axis_y_p2 = Vector3(pos_x - 10, 0, pos_y - 10)
				local axis_y_p3 = Vector3(pos_x, 0, pos_y + 10)
				slot24 = Gui.triangle
				slot25 = gui
				slot26 = axis_y_p1
				slot27 = axis_y_p2
				slot28 = axis_y_p3
				slot29 = 1
				slot30 = color_map_for_label

				if not node.label then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 86-86, warpins: 1 ---
					slot31 = 0
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 87-92, warpins: 2 ---
				slot24(slot25, slot26, slot27, slot28, slot29, slot30[slot31]:unbox())
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 93-107, warpins: 1 ---
				slot21 = Gui.rect
				slot22 = gui
				slot23 = Vector2(pos_x - 10, pos_y - 10)
				slot24 = Vector2(15, 15)
				slot25 = color_map_for_label

				if not node.label then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 108-108, warpins: 1 ---
					slot26 = 0
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 109-113, warpins: 2 ---
				slot21(slot22, slot23, slot24, slot25[slot26]:unbox())
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		slot21 = Gui.text_extents
		slot22 = gui

		if not node.type then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 120-120, warpins: 1 ---
			slot23 = ""
			--- END OF BLOCK #0 ---



		end

		local min, max = slot21(slot22, slot23, font, font_size)
		local text_width = max.x - min.x
		slot24 = Gui.text
		slot25 = gui

		if not node.type then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 133-133, warpins: 1 ---
			slot26 = ""
			--- END OF BLOCK #0 ---



		end

		slot24(slot25, slot26, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - 20, 0), Color(255, 0, 0, 0))

		slot24 = "connected_to:"

		if not node.connected_to then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 154-154, warpins: 1 ---
			slot25 = 0
			--- END OF BLOCK #0 ---



		end

		local connected_to_text = slot24 .. slot25
		min, max = Gui.text_extents(gui, connected_to_text, font, font_size)
		text_width = max.x - min.x

		Gui.text(gui, connected_to_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - 40, 0), Color(255, 0, 0, 0))

		slot25 = "label:"

		if not node.label then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 192-192, warpins: 1 ---
			slot26 = 0
			--- END OF BLOCK #0 ---



		end

		local label_text = slot25 .. slot26
		min, max = Gui.text_extents(gui, label_text, font, font_size)
		text_width = max.x - min.x
		slot26 = Gui.text
		slot27 = gui
		slot28 = label_text
		slot29 = font
		slot30 = font_size
		slot31 = font_material
		slot32 = Vector3(pos_x - text_width * 0.5, pos_y - 50, 0)
		slot33 = color_map_for_label
		slot34 = node.label or 0

		Gui.text(gui, label_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - 50, 0), color_map_for_label[slot34]:unbox())

		min, max = Gui.text_extents(gui, key, font, font_size)
		text_width = max.x - min.x

		Gui.text(gui, key, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y + 20, 0), Color(255, 0, 0, 0))

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #6 223-223, warpins: 1 ---
		slot34 = 0
		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 224-260, warpins: 2 ---
		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #8 261-262, warpins: 2 ---
		--- END OF BLOCK #8 ---



	end
end

DeusDebugMapUI._draw_final_graph = function (self, graph, dt, t)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	local font = "materials/fonts/arial"
	local font_material = "arial"
	local font_size = 10
	local width, height = Gui.resolution()
	local min_x = width * start_x
	local min_y = height * start_y
	local layout_width = width * total_width
	local layout_height = height * total_height
	local gui = self._gui

	self:_draw_edges(graph)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-371, warpins: 0 ---
	for key, node in pairs(graph) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-85, warpins: 1 ---
		local pos_x = min_x + layout_width * graph[key].layout_x
		local pos_y = min_y + layout_height * graph[key].layout_y
		local y_delta = 10

		Gui.rect(gui, Vector2(pos_x - 10, pos_y - 10), Vector2(20, 20), Color(255, 0, 0, 0))

		local level_text = node.level
		local min, max = Gui.text_extents(gui, level_text, font, font_size)
		local text_width = max.x - min.x
		y_delta = y_delta + 10

		Gui.text(gui, level_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - y_delta, 0), Color(255, 0, 0, 0))

		local director_name = node.conflict_settings

		if not director_name then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 86-86, warpins: 1 ---
			local conflict_text = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 87-123, warpins: 2 ---
		min, max = Gui.text_extents(gui, conflict_text, font, font_size)
		text_width = max.x - min.x
		y_delta = y_delta + 10

		Gui.text(gui, conflict_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - y_delta, 0), Color(255, 0, 0, 0))

		local director = ConflictDirectors[director_name]

		if director and director.description then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 127-133, warpins: 1 ---
			if not ("breed: " .. Localize(director.description)) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 134-134, warpins: 1 ---
				local conflict_description_text = ""
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 135-167, warpins: 2 ---
			min, max = Gui.text_extents(gui, conflict_description_text, font, font_size)
			text_width = max.x - min.x
			y_delta = y_delta + 10

			Gui.text(gui, conflict_description_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - y_delta, 0), Color(255, 0, 0, 0))
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 168-170, warpins: 3 ---
		if node.curse then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 171-206, warpins: 1 ---
			local curse_text = "curse: " .. node.curse
			min, max = Gui.text_extents(gui, curse_text, font, font_size)
			text_width = max.x - min.x
			y_delta = y_delta + 10

			Gui.text(gui, curse_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - y_delta, 0), Color(255, 0, 0, 0))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 207-209, warpins: 2 ---
		if node.minor_modifier_group then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 210-249, warpins: 1 ---
			local minor_modifier_text = "modifiers: " .. table.concat(node.minor_modifier_group, ", ")
			min, max = Gui.text_extents(gui, minor_modifier_text, font, font_size)
			text_width = max.x - min.x
			y_delta = y_delta + 10

			Gui.text(gui, minor_modifier_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - y_delta, 0), Color(255, 0, 0, 0))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 250-252, warpins: 2 ---
		if node.terror_event_power_up then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 253-291, warpins: 1 ---
			local terror_event_power_up_text = "power_up: " .. node.terror_event_power_up .. "(" .. node.terror_event_power_up_rarity .. ")"
			min, max = Gui.text_extents(gui, terror_event_power_up_text, font, font_size)
			text_width = max.x - min.x
			y_delta = y_delta + 10

			Gui.text(gui, terror_event_power_up_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - y_delta, 0), Color(255, 0, 0, 0))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 292-369, warpins: 2 ---
		local key_text = key .. " (" .. math.floor(node.run_progress * 100) / 100 .. ")"
		min, max = Gui.text_extents(gui, key_text, font, font_size)
		text_width = max.x - min.x

		Gui.text(gui, key_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y + 20, 0), Color(255, 0, 0, 0))

		local level_seed_text = "level_seed :" .. node.level_seed
		min, max = Gui.text_extents(gui, level_seed_text, font, font_size)
		text_width = max.x - min.x
		y_delta = y_delta + 10

		Gui.text(gui, level_seed_text, font, font_size, font_material, Vector3(pos_x - text_width * 0.5, pos_y - y_delta, 0), Color(255, 0, 0, 0))
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 370-371, warpins: 2 ---
		--- END OF BLOCK #6 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 372-372, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

DeusDebugMapUI._draw_edges = function (self, graph)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	local width, height = Gui.resolution()
	local min_x = width * start_x
	local min_y = height * start_y
	local layout_width = width * total_width
	local layout_height = height * total_height

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-46, warpins: 0 ---
	for key, node in pairs(graph) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-27, warpins: 1 ---
		local pos_x = min_x + layout_width * graph[key].layout_x
		local pos_y = min_y + layout_height * graph[key].layout_y

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 28-44, warpins: 0 ---
		for _, next in ipairs(node.next) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-42, warpins: 1 ---
			local target_x = min_x + layout_width * graph[next].layout_x
			local target_y = min_y + layout_height * graph[next].layout_y

			self:_draw_edge(pos_x, pos_y, target_x, target_y)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 43-44, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 45-46, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 47-47, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

DeusDebugMapUI._draw_edge = function (self, from_x, from_y, to_x, to_y)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	local dx = to_x - from_x
	local dy = to_y - from_y

	if dx ~= 0 or dy ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-24, warpins: 2 ---
		local distance = math.sqrt(dx * dx + dy * dy)
		local dot_count = math.floor(distance / 10)
		local dot_delta_x = dx / dot_count
		local dot_delta_y = dy / dot_count
		local current_dot_x = from_x
		local current_dot_y = from_y

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-49, warpins: 0 ---
		for i = 1, dot_count, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-49, warpins: 2 ---
			Gui.rect(self._gui, Vector2(current_dot_x, current_dot_y), Vector2(2 + 5 * i / dot_count, 2 + 5 * i / dot_count), Color(128, 0, 0, 0))

			current_dot_x = current_dot_x + dot_delta_x
			current_dot_y = current_dot_y + dot_delta_y
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 50-50, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return
