-- chunkname: @scripts/unit_extensions/default_player_unit/player_hud.lua

local font_size = 26
local font = "arial"
local font_mtrl = "materials/fonts/" .. font

PlayerHud = class(PlayerHud)

PlayerHud.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")
	self.raycast_state = "waiting_to_raycast"
	self.raycast_target = nil

	local physics_world = World.get_data(extension_init_context.world, "physics_world")

	self.physics_world = physics_world
	self.current_location = nil
	self.picked_up_ammo = false
	self.hit_marker_data = {}

	self:reset()
end

PlayerHud.extensions_ready = function (self, world, unit)
	return
end

PlayerHud.destroy = function (self)
	return
end

PlayerHud.reset = function (self)
	self.outline_timers = {}
end

local show_intensity = true

PlayerHud.update = function (self, unit, input, dt, context, t)
	return
end

PlayerHud.draw_player_names = function (self, unit)
	local player_manager = Managers.player
	local players = player_manager:players()
	local viewport_name = "player_1"
	local viewport = ScriptWorld.viewport(self.world, viewport_name)
	local camera = ScriptViewport.camera(viewport)
	local res_x, res_y = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local viewport_center = Vector3(res_x / 2, res_y / 2, 0)
	local text_visibility_radius_sq = res_y / 3

	text_visibility_radius_sq = text_visibility_radius_sq * text_visibility_radius_sq

	local gui = self.gui
	local offset_vector = Vector3(0, 0, 0.925)

	for k, player in pairs(players) do
		local name = player:name()

		if player.player_unit and player.player_unit ~= unit then
			local player_world_pos_center = Unit.local_position(player.player_unit, 0) + offset_vector
			local player_world_pos_head = player_world_pos_center + offset_vector

			if Camera.inside_frustum(camera, player_world_pos_center) > 0 then
				local min, max = Gui.text_extents(gui, name, font_mtrl, font_size)
				local text_length = max.x - min.x
				local player_screen_pos_center = Camera.world_to_screen(camera, player_world_pos_center)

				player_screen_pos_center = Vector3(player_screen_pos_center.x, player_screen_pos_center.z, 0)

				local player_screen_pos_head = Camera.world_to_screen(camera, player_world_pos_head)
				local text_pos = Vector3(player_screen_pos_head.x - text_length / 2, player_screen_pos_head.z, 0)
				local distance_to_center_sq = Vector3.distance_squared(player_screen_pos_center, viewport_center)
				local delta = math.max(text_visibility_radius_sq - distance_to_center_sq, 0)
				local opacity = delta / text_visibility_radius_sq
				local color = Color(255 * opacity, 0, 200, 200)

				Gui.text(gui, name, font_mtrl, font_size, font, text_pos, color)
			end
		end
	end
end

PlayerHud.set_current_location = function (self, location)
	self.current_location = location
end

PlayerHud.block_current_location_ui = function (self, block_ui)
	self.location_ui_blocked = block_ui
end

PlayerHud.gdc_intro_active = function (self, state)
	self.show_gdc_intro = true
end

PlayerHud.set_picked_up_ammo = function (self, picked_up_ammo)
	self.picked_up_ammo = picked_up_ammo
end

PlayerHud.get_picked_up_ammo = function (self)
	return self.picked_up_ammo
end
