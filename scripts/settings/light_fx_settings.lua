local percent_to_rgb = nil
LightFXSettings = {
	inn_level = {
		value = {
			255,
			255,
			0,
			255,
			1
		}
	},
	loading = {
		value = {
			128,
			128,
			128,
			128,
			1
		}
	},
	ingame = {
		value = {
			0,
			255,
			0,
			255,
			1
		},
		update_func = function (v)
			assert(#v == 5, "[LightFXManager] You need to pass in 5 values ( red, green, blue, intensity, blendtime )")

			local game = Managers.state.network and Managers.state.network:game()

			if not game then
				return v
			end

			local player = Managers.player:local_player()

			if not player then
				return v
			end

			local unit = player.player_unit

			if Unit.alive(unit) then
				local health_ext = ScriptUnit.extension(unit, "health_system")
				local health_percent = health_ext.current_health_percent(health_ext)
				v[1], v[2], v[3] = percent_to_rgb(health_percent)
			end

			return v
		end
	}
}
LightFXConditionalSettings = {
	{
		name = "Knocked down",
		value = {
			255,
			0,
			0,
			60,
			2
		},
		condition_func = function ()
			local game = Managers.state.network and Managers.state.network:game()

			if not game then
				return 
			end

			local player = Managers.player:local_player()

			if not player then
				return 
			end

			local unit = player.player_unit

			if Unit.alive(unit) then
				local status_ext = ScriptUnit.extension(unit, "status_system")

				if status_ext.knocked_down or status_ext.is_ready_for_assisted_respawn(status_ext) then
					return true
				end
			else
				return true
			end

			return 
		end,
		update_func = function (dt, t, v)
			Managers.light_fx:set_lightfx_color(v[1], v[2], v[3], v[4], v[5])

			return 
		end
	},
	{
		name = "Hit",
		time = 0.5,
		value = {
			255,
			0,
			0,
			255,
			0.1
		},
		condition_func = function ()
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
			local strided_array, array_length = health_extension.recent_damages(health_extension)
			local damaged = 0 < array_length

			return damaged
		end,
		update_func = function (dt, t, v)
			Managers.light_fx:set_lightfx_color(v[1], v[2], v[3], v[4], v[5])

			return 
		end
	}
}

function percent_to_rgb(percent)
	percent = 1 - percent

	if percent == 1 then
		percent = 0.99
	end

	local r, g, b = nil

	if percent < 0.5 then
		r = math.floor(255 * percent / 0.5)
		g = 255
	else
		r = 255
		g = math.floor(255 * (0.5 - percent % 0.5) / 0.5)
	end

	b = 0

	return r, g, b
end

return 
