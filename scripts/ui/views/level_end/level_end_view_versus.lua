-- chunkname: @scripts/ui/views/level_end/level_end_view_versus.lua

LevelEndViewVersus = class(LevelEndViewVersus, LevelEndViewBase)

LevelEndViewVersus._setup_pages_victory = function (self, rewards)
	if not self._is_untrusted then
		return {
			EndViewStateScoreVS = 1,
		}
	else
		return {
			EndViewStateScoreVS = 1,
		}
	end
end

LevelEndViewVersus._setup_pages_defeat = function (self, rewards)
	if not self._is_untrusted then
		return {
			EndViewStateScoreVS = 1,
		}
	else
		return {
			EndViewStateScoreVS = 1,
		}
	end
end

LevelEndViewVersus._setup_pages_untrusted = function (self)
	return {
		EndViewStateScoreVS = 1,
	}
end

LevelEndViewVersus.start = function (self)
	print("[LevelEndView] Started LevelEndViewVersus")
	LevelEndViewVersus.super.start(self)
end

local extra_portrait_materials = {}

for _, dlc in pairs(DLCSettings) do
	local portrait_materials = dlc.portrait_materials

	if portrait_materials then
		for _, path in ipairs(portrait_materials) do
			extra_portrait_materials[#extra_portrait_materials + 1] = path
		end
	end
end

LevelEndViewVersus.create_ui_renderer = function (self, context, world, top_world)
	local materials = {
		"material",
		"materials/ui/ui_1080p_carousel_atlas",
		"material",
		"materials/ui/ui_1080p_hud_atlas_textures",
		"material",
		"materials/ui/ui_1080p_hud_single_textures",
		"material",
		"materials/ui/ui_1080p_menu_atlas_textures",
		"material",
		"materials/ui/ui_1080p_menu_single_textures",
		"material",
		"materials/ui/ui_1080p_common",
		"material",
		"materials/fonts/gw_fonts",
	}
	local extra_materials = self.get_extra_materials

	if extra_materials then
		for _, extra_material in ipairs(extra_materials) do
			materials[#materials + 1] = extra_material
		end
	end

	for _, extra_portrait_material in ipairs(extra_portrait_materials) do
		materials[#materials + 1] = "material"
		materials[#materials + 1] = extra_portrait_material
	end

	local ui_renderer = UIRenderer.create(world, unpack(materials))
	local ui_top_renderer = UIRenderer.create(top_world, unpack(materials))

	return ui_renderer, ui_top_renderer
end

LevelEndViewVersus.update = function (self, dt, t)
	LevelEndViewVersus.super.update(self, dt, t)

	if not self._playing_music then
		self._playing_music = true

		self:play_sound(self._start_music_event)
	end
end

LevelEndViewVersus.set_input_description = function (self, input_desc)
	self._menu_input_description:set_input_description(definitions.generic_input_actions[input_desc])
end

LevelEndViewVersus.destroy = function (self)
	LevelEndViewVersus.super.destroy(self)
end

LevelEndViewVersus.do_retry = function (self)
	return false
end

LevelEndViewVersus.active_input_service = function (self)
	return self.input_blocked and FAKE_INPUT_SERVICE or self:input_service()
end

LevelEndViewVersus.setup_pages = function (self, game_won, rewards)
	local index_by_state_name

	if self._is_untrusted then
		index_by_state_name = self:_setup_pages_untrusted()
	elseif game_won then
		index_by_state_name = self:_setup_pages_victory(rewards)
	else
		index_by_state_name = self:_setup_pages_defeat(rewards)
	end

	return index_by_state_name
end
