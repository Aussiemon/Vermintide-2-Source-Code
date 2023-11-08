local OP = table.map(TagQuery.OP, function (v)
	return tostring(v)
end)
local global_filters = {
	pbw_curse_09 = {
		{
			"global_context",
			"bw_necromancer",
			OP.EQ,
			true
		}
	},
	pbw_curse_23 = {
		{
			"global_context",
			"bw_necromancer",
			OP.EQ,
			true
		}
	},
	pbw_level_nurgle_coming_down_04 = {
		{
			"global_context",
			"bw_necromancer",
			OP.EQ,
			true
		}
	}
}

return global_filters
