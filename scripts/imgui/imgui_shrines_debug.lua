-- chunkname: @scripts/imgui/imgui_shrines_debug.lua

ImguiShrinesDebug = class(ImguiShrinesDebug)

local SHOULD_RELOAD = true

ImguiShrinesDebug.init = function (self)
	return
end

ImguiShrinesDebug.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end
end

ImguiShrinesDebug.is_persistent = function (self)
	return true
end

ImguiShrinesDebug.draw = function (self, is_open)
	if not Managers.state or not Managers.state.game_mode or Managers.state.game_mode:game_mode_key() ~= "deus" then
		local do_close = Imgui.begin_window("Shrines Debug", "always_auto_resize")

		Imgui.text("This UI only works when playing a deus level.")
		Imgui.end_window()

		return do_close
	end

	local do_close = Imgui.begin_window("Shrines Debug", "always_auto_resize")

	self:_update_controls()
	Imgui.end_window()

	return do_close
end

ImguiShrinesDebug._shrine_types = function (self)
	local types = table.values(DEUS_CHEST_TYPES)

	table.insert(types, "deus_cursed_chest")

	return types
end

ImguiShrinesDebug._cursed_chest_challenges = function (self)
	local challenges = {
		"default",
	}

	table.append(challenges, table.keys_if(GenericTerrorEvents, nil, function (key)
		return string.sub(key, 1, string.len("cursed_chest_challenge")) == "cursed_chest_challenge"
	end))

	return challenges
end

ImguiShrinesDebug._update_controls = function (self)
	local chest_types = self:_shrine_types()
	local shrine_type_index = table.index_of(chest_types, self._selected_shrine_type or next(DEUS_CHEST_TYPES))

	self._selected_shrine_type = chest_types[Imgui.combo("Shrine Type", shrine_type_index, chest_types)]

	if self._selected_shrine_type == "deus_cursed_chest" then
		local challenges = self:_cursed_chest_challenges()
		local challenge_index = table.index_of(challenges, self._selected_cursed_challenge or "default")

		self._selected_cursed_challenge = challenges[Imgui.combo("Challenge", challenge_index, challenges, 20)]
	end

	if not Managers.state.network.is_server and self._selected_shrine_type == "deus_cursed_chest" and self._selected_cursed_challenge ~= "default" then
		Imgui.text("Clients can not spawn chests with a specific challenge. Please select 'default'.")

		return
	end

	if Imgui.button("Spawn", 100, 20) then
		local local_player = Managers.player and Managers.player:local_player()

		if not local_player or not local_player.player_unit then
			return
		end

		local position = POSITION_LOOKUP[local_player.player_unit]
		local pickup_system = Managers.state.entity:system("pickup_system")

		if self._selected_shrine_type == "deus_cursed_chest" then
			local shrine_unit = pickup_system:debug_spawn_pickup("deus_cursed_chest", position)

			if shrine_unit then
				local terror_event = self._selected_cursed_challenge == "default" and "cursed_chest_prototype" or self._selected_cursed_challenge

				Unit.set_data(shrine_unit, "debug_override_terror_event", terror_event)
			end
		else
			pickup_system:debug_spawn_pickup("DEBUG_deus_weapon_chest_" .. self._selected_shrine_type, position)
		end
	end
end
