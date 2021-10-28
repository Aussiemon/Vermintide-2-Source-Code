local death_reactions = {
	geheimnisnacht_2021_altar = {
		unit = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local altar_extension = ScriptUnit.has_extension(unit, "props_system")

				if altar_extension then
					altar_extension:die()
				end

				return nil, DeathReactions.IS_DONE
			end,
			update = function (unit, dt, context, t, data)
				return DeathReactions.IS_DONE
			end
		},
		husk = {
			pre_start = function (unit, context, t, killing_blow)
				return
			end,
			start = function (unit, context, t, killing_blow, is_server)
				local altar_extension = ScriptUnit.has_extension(unit, "props_system")

				if altar_extension then
					altar_extension:die()
				end

				return nil, DeathReactions.IS_DONE
			end,
			update = function (unit, dt, context, t, data)
				return DeathReactions.IS_DONE
			end
		}
	}
}

return death_reactions
