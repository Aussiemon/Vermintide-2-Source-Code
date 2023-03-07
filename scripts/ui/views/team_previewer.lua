require("scripts/ui/views/world_hero_previewer")

TeamPreviewer = class(TeamPreviewer)

TeamPreviewer.init = function (self, ingame_ui_context, world, viewport)
	self.hero_previewers = {}
	self._context = ingame_ui_context
	self.world = world
	self.camera = ScriptViewport.camera(viewport)
end

TeamPreviewer.setup_team = function (self, hero_data, hero_arrangement)
	self:destroy_previewers()

	local previewers = self.hero_previewers

	for i = 1, #hero_data do
		local hero_previewer = HeroPreviewer:new(self._context)

		self:_spawn_hero(hero_previewer, hero_data[i])

		previewers[#previewers + 1] = hero_previewer
	end

	local orientate_towards_camera = true
	local character_look_target = Vector3Aux.box(nil, ScriptCamera.position(self.camera))

	self:update_hero_arrangement(hero_arrangement, character_look_target, orientate_towards_camera)
end

TeamPreviewer.on_enter = function (self)
	return
end

TeamPreviewer.update = function (self, dt, t)
	local previewers = self.hero_previewers

	for i = 1, #previewers do
		previewers[i]:update(dt, t)
	end
end

TeamPreviewer.post_update = function (self, dt, t)
	local previewers = self.hero_previewers

	for i = 1, #previewers do
		previewers[i]:post_update(dt, t)
	end
end

TeamPreviewer.on_exit = function (self)
	self:destroy_previewers()
end

TeamPreviewer.clear_team = function (self)
	local previewers = self.hero_previewers

	for i = 1, #previewers do
		local hero_previewer = previewers[i]

		if hero_previewer then
			hero_previewer:clear_units()
		end
	end
end

TeamPreviewer.destroy_previewers = function (self)
	local previewers = self.hero_previewers

	for i = 1, #previewers do
		local hero_previewer = previewers[i]

		if hero_previewer then
			hero_previewer:prepare_exit()
			hero_previewer:on_exit()
			hero_previewer:destroy()
		end
	end

	self.hero_previewers = {}
end

TeamPreviewer._spawn_hero = function (self, hero_previewer, hero_data)
	hero_previewer:on_enter(self.world)

	local callback = callback(self, "cb_hero_unit_spawned_skin_preview", hero_previewer, hero_data)

	hero_previewer:request_spawn_hero_unit(hero_data.hero_name, hero_data.career_index, callback, hero_data.skin_name)
end

TeamPreviewer.cb_hero_unit_spawned_skin_preview = function (self, hero_previewer, hero_data)
	local preview_items = hero_data.preview_items
	local weapon_slot = hero_data.weapon_slot

	for i = 1, #preview_items do
		local item = preview_items[i]

		if item then
			local item_name = item.item_name

			if item_name then
				local item_template = ItemMasterList[item_name]
				local slot_type = item_template.slot_type
				local slot_names = InventorySettings.slot_names_by_type[slot_type]
				local slot_name = slot_names[1]
				local slot = InventorySettings.slots_by_name[slot_name]

				hero_previewer:equip_item(item_name, slot, nil, item.skin_name)
			end
		end
	end

	if weapon_slot then
		hero_previewer:wield_weapon_slot(weapon_slot)
	end

	local preview_idle_animation = hero_data.preview_animation or "idle"

	if preview_idle_animation then
		hero_previewer:play_character_animation(preview_idle_animation)
	end
end

TeamPreviewer.update_hero_arrangement = function (self, hero_arrangement, lookat_target, orientate_towards_camera)
	local arrangement = hero_arrangement
	local previewers = self.hero_previewers
	local camera_location = ScriptCamera.position(self.camera)

	for i = 1, #previewers do
		local hero_previewer = previewers[i]

		if hero_previewer then
			hero_previewer:set_hero_location(arrangement[i])
			hero_previewer:set_hero_look_target(lookat_target)

			if orientate_towards_camera then
				local location = Vector3Aux.unbox(arrangement[i])
				local direction = Vector3.flat(camera_location - location)
				local angle = -math.atan2(direction[1], direction[2])

				hero_previewer:set_hero_rotation(angle)
			end
		end
	end
end

TeamPreviewer.set_camera_orientation = function (self, position, lookat_target)
	local position_vec = Vector3Aux.unbox(position)
	local lookat_vec = Vector3Aux.unbox(lookat_target)
	local direction = Vector3.normalize(lookat_vec - position_vec)
	local rotation = Quaternion.look(direction)

	ScriptCamera.set_local_rotation(self.camera, rotation)
	ScriptCamera.set_local_position(self.camera, position_vec)
end

TeamPreviewer.set_camera_fov = function (self, fov)
	Camera.set_vertical_fov(self.camera, math.degrees_to_radians(fov))
end
