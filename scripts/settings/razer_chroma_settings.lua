RazerChromaSettings = {
	health_potion = {
		length = 2,
		file_path = "razer_chromas/healthpotion"
	},
	cooldown_reduction_potion = {
		length = 2,
		file_path = "razer_chromas/concentrationpotion"
	},
	cooldown_reduction_potion_increased = {
		length = 2,
		file_path = "razer_chromas/concentrationpotion"
	},
	cooldown_reduction_potion_reduced = {
		length = 2,
		file_path = "razer_chromas/concentrationpotion"
	},
	speed_boost_potion = {
		length = 2,
		file_path = "razer_chromas/speedpotion"
	},
	speed_boost_potion_increased = {
		length = 2,
		file_path = "razer_chromas/speedpotion"
	},
	speed_boost_potion_reduced = {
		length = 2,
		file_path = "razer_chromas/speedpotion"
	},
	damage_boost_potion = {
		length = 2,
		file_path = "razer_chromas/damagepotion"
	},
	damage_boost_potion_increased = {
		length = 2,
		file_path = "razer_chromas/damagepotion"
	},
	damage_boost_potion_reduced = {
		length = 2,
		file_path = "razer_chromas/damagepotion"
	},
	hit = {
		file_path = "razer_chromas/hit",
		length = 0.3,
		condition_play_func = function (manager)
			if manager.current_animation == "hit" then
				return false
			end

			local game = Managers.state.network and Managers.state.network:game()

			if not game then
				return false
			end

			local player = Managers.player:local_player()

			if not player then
				return false
			end

			local unit = player.player_unit

			if not Unit.alive(unit) then
				return false
			end

			local health_extension = ScriptUnit.extension(unit, "health_system")
			local damage_type, hit_type = health_extension:recently_damaged()
			local strided_array, array_length = health_extension:recent_damages()
			local took_hit = damage_type and not table.contains(NetworkLookup.damage_sources, damage_type)

			return took_hit, false, RAZER_ADD_ANIMATION_TYPE.REPLACE
		end
	},
	knocked_down = {
		file_path = "razer_chromas/knockeddown",
		length = 1.2,
		condition_play_func = function (manager)
			if manager.current_animation == "knocked_down" then
				return false
			end

			local game = Managers.state.network and Managers.state.network:game()

			if not game then
				return false
			end

			local player = Managers.player:local_player()

			if not player then
				return false
			end

			local unit = player.player_unit

			if not Unit.alive(unit) then
				return false
			end

			local unit = player.player_unit

			if Unit.alive(unit) then
				local status_ext = ScriptUnit.extension(unit, "status_system")

				if status_ext.knocked_down or status_ext:is_ready_for_assisted_respawn() then
					return true, true, RAZER_ADD_ANIMATION_TYPE.REPLACE
				end
			else
				return true, true, RAZER_ADD_ANIMATION_TYPE.REPLACE
			end

			return false
		end,
		condition_stop_func = function (manager)
			local game = Managers.state.network and Managers.state.network:game()

			if not game then
				return true
			end

			local player = Managers.player:local_player()

			if not player then
				return true
			end

			local unit = player.player_unit

			if not Unit.alive(unit) then
				return true
			end

			local unit = player.player_unit

			if Unit.alive(unit) then
				local status_ext = ScriptUnit.extension(unit, "status_system")

				if status_ext.knocked_down or status_ext:is_ready_for_assisted_respawn() then
					return false
				end
			else
				return false
			end

			return true
		end
	}
}
