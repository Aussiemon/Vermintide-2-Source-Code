-- chunkname: @scripts/settings/dlcs/morris/twitch_vote_templates_morris.lua

local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[Twitch] " .. string.format(message, ...))
	end
end

local vote_level_template = {
	cost = 0,
	text = "twitch_vote_next_deus_level",
	texture_id = "level_image_any",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		local game_mode_name = Managers.state.game_mode:game_mode_key()

		return game_mode_name == "map_deus"
	end,
	on_success = function (is_server, vote_index, vote_template)
		if is_server then
			local level_name = vote_template.level_name

			debug_print("Level %s was selected", level_name)

			local mechanism = Managers.mechanism:game_mechanism()
			local run_controller = mechanism:get_deus_run_controller()
			local graph = run_controller:get_graph_data()
			local node = run_controller:get_current_node()
			local next_node_keys = node.next

			for _, next_node_key in ipairs(next_node_keys) do
				local next_node = graph[next_node_key]

				if next_node.base_level == level_name then
					run_controller:set_twitch_level_vote(next_node_key)

					return
				end
			end

			assert(false, "Couldn't find level that was voted on by twitch")
		end
	end,
}

TwitchVoteDeusSelectLevelNames = TwitchVoteDeusSelectLevelNames or {}

for _, level_settings in pairs(DEUS_LEVEL_SETTINGS) do
	local base_level_name = level_settings.base_level_name
	local new_vote_template = table.clone(vote_level_template)

	new_vote_template.text = level_settings.display_name
	new_vote_template.level_name = base_level_name

	local texture_id = level_settings.texture_id

	if texture_id then
		new_vote_template.texture_id = texture_id
	end

	local new_vote_template_name = "twitch_vote_deus_select_level_" .. base_level_name

	TwitchVoteTemplates[new_vote_template_name] = new_vote_template
	TwitchVoteDeusSelectLevelNames[base_level_name] = new_vote_template_name
end

for shop_name, settings in pairs(DeusShopSettings.shop_types) do
	local new_vote_template = table.clone(vote_level_template)

	new_vote_template.text = shop_name .. "_title"
	new_vote_template.level_name = shop_name

	local texture_id = settings.twitch_icon

	if texture_id then
		new_vote_template.texture_id = texture_id
	end

	local new_vote_template_name = "twitch_vote_deus_select_level_" .. shop_name

	TwitchVoteTemplates[new_vote_template_name] = new_vote_template
	TwitchVoteDeusSelectLevelNames[shop_name] = new_vote_template_name
end
