-- chunkname: @scripts/settings/news_feed_templates.lua

NewsFeedTemplates = {
	{
		cooldown = -1,
		description = "news_feed_vt1_skins_description",
		duration = 5,
		infinite = false,
		name = "vt1_skins",
		title = "news_feed_vt1_skins_title",
		condition_func = function (params)
			if ItemHelper.has_new_sign_in_reward("vt1_skins") then
				return true
			end
		end,
		removed_func = function (params)
			ItemHelper.unmark_sign_in_reward_as_new("vt1_skins")
		end,
	},
	{
		cooldown = -1,
		duration = 0,
		hidden = true,
		infinite = false,
		name = "vt2_collectors_edition",
		condition_func = function (params)
			if ItemHelper.has_new_sign_in_reward("vt2_collectors_edition") then
				return true
			end
		end,
		removed_func = function (params)
			ItemHelper.unmark_sign_in_reward_as_new("vt2_collectors_edition")
		end,
	},
	{
		cooldown = -1,
		duration = 0,
		hidden = true,
		infinite = false,
		name = "celebrate_frame",
		condition_func = function (params)
			if ItemHelper.has_new_sign_in_reward("celebrate_2019") then
				return true
			end
		end,
		removed_func = function (params)
			ItemHelper.unmark_sign_in_reward_as_new("celebrate_2019")
		end,
	},
	{
		cooldown = -1,
		description = "news_feed_unclaimed_challenge_description",
		duration = 5,
		infinite = false,
		name = "unclaimed_challenge",
		title = "news_feed_unclaimed_challenge_title",
		condition_func = function (params)
			local has_any_unclaimed_achievement = Managers.state.achievement:has_any_unclaimed_achievement()

			return has_any_unclaimed_achievement
		end,
	},
	{
		cooldown = -1,
		description = "news_feed_unclaimed_quest_description",
		duration = 5,
		infinite = false,
		name = "unclaimed_quest",
		title = "news_feed_unclaimed_quest_title",
		condition_func = function (params)
			local has_any_unclaimed_quests = Managers.state.quest:has_any_unclaimed_quests()

			return has_any_unclaimed_quests
		end,
	},
	{
		cooldown = -1,
		description = "news_feed_equipment_description",
		duration = 5,
		infinite = false,
		name = "equipment",
		title = "news_feed_equipment_title",
		condition_func = function (params)
			local mechanism = Managers.mechanism:current_mechanism_name()

			if mechanism == "versus" then
				return false
			end

			local rarities_to_ignore = params.rarities_to_ignore

			if ItemHelper.has_new_backend_ids_by_slot_type("trinket", rarities_to_ignore) then
				return true
			elseif ItemHelper.has_new_backend_ids_by_slot_type("ring", rarities_to_ignore) then
				return true
			elseif ItemHelper.has_new_backend_ids_by_slot_type("necklace", rarities_to_ignore) then
				return true
			else
				local hero_name = params.hero_name
				local profile_index = FindProfileIndex(hero_name)
				local profile = SPProfiles[profile_index]
				local careers = profile.careers

				for _, career in ipairs(careers) do
					local career_name = career.name

					if ItemHelper.has_new_backend_ids_by_career_name_and_slot_type(career_name, "melee", rarities_to_ignore) then
						return true
					elseif ItemHelper.has_new_backend_ids_by_career_name_and_slot_type(career_name, "ranged", rarities_to_ignore) then
						return true
					end
				end
			end
		end,
	},
	{
		cooldown = -1,
		description = "news_feed_store_description",
		duration = 5,
		icon = "hud_store_icon",
		infinite = false,
		name = "new_shop_items",
		title = "news_feed_store_title",
		icon_offset = {
			40,
			20,
			3,
		},
		icon_size = {
			40,
			40,
		},
		condition_func = function (params)
			local backend_store = Managers.backend:get_interface("peddler")
			local login_rewards = backend_store:get_login_rewards()

			return login_rewards.next_claim_timestamp < os.time()
		end,
	},
	{
		cooldown = -1,
		description = "news_feed_talent_description",
		duration = 5,
		infinite = false,
		name = "talent",
		title = "news_feed_talent_title",
		condition_func = function (params)
			local hero_name = params.hero_name
			local career_name = params.career_name
			local talent_interface = Managers.backend:get_interface("talents")
			local current_talents = talent_interface:get_talents(career_name)
			local num_spent_talents = 0

			if current_talents then
				for _, value in ipairs(current_talents) do
					if value > 0 then
						num_spent_talents = num_spent_talents + 1
					end
				end
			end

			local experience = ExperienceSettings.get_experience(hero_name)
			local player_level = ExperienceSettings.get_level(experience)
			local unlocked_talents_points = 0
			local debug_unlock_talents = Development.parameter("debug_unlock_talents")

			for template_name, _ in pairs(TalentUnlockLevels) do
				if ProgressionUnlocks.is_unlocked(template_name, player_level) or debug_unlock_talents then
					unlocked_talents_points = unlocked_talents_points + 1
				end
			end

			return num_spent_talents < unlocked_talents_points
		end,
	},
	{
		cooldown = -1,
		description = "news_feed_career_description",
		duration = 5,
		infinite = false,
		name = "career",
		title = "news_feed_career_title",
		condition_func = function (params)
			return false
		end,
	},
	{
		cooldown = -1,
		description = "news_feed_cosmetics_description",
		duration = 5,
		infinite = false,
		name = "cosmetics",
		title = "news_feed_cosmetics_title",
		condition_func = function (params)
			local career_name = params.career_name

			if ItemHelper.has_new_backend_ids_by_career_name_and_slot_type(career_name, "skin") then
				return true
			elseif ItemHelper.has_new_backend_ids_by_slot_type("frame") then
				return true
			elseif ItemHelper.has_new_backend_ids_by_career_name_and_slot_type(career_name, "hat") then
				return true
			end
		end,
	},
	{
		cooldown = -1,
		description = "news_feed_loot_chest_description",
		duration = 5,
		infinite = false,
		name = "loot_chest",
		title = "news_feed_loot_chest_title",
		condition_func = function (params)
			return ItemHelper.has_new_backend_ids_by_slot_type("loot_chest")
		end,
	},
	{
		cooldown = -1,
		duration = 0,
		hidden = true,
		infinite = false,
		name = "sign_in_rewards",
		condition_func = function (params)
			if ItemHelper.has_new_sign_in_reward() then
				return true
			end
		end,
		added_func = function (params)
			local event_manager = Managers.state.event
			local backend_manager = Managers.backend

			if event_manager and backend_manager then
				local item_interface = backend_manager:get_interface("items")

				if item_interface then
					local rewards_presentation_data = {}

					for reward_id, items in pairs(PlayerData.new_sign_in_rewards) do
						for _, backend_id in ipairs(items) do
							if item_interface:get_item_from_id(backend_id) ~= nil then
								table.insert(rewards_presentation_data, {
									type = "item",
									backend_id = backend_id,
								})
							end
						end

						ItemHelper.unmark_sign_in_reward_as_new(reward_id)
					end

					if #rewards_presentation_data > 0 then
						event_manager:trigger("present_rewards", rewards_presentation_data)
					end
				end
			end
		end,
	},
}

function FindNewsTemplateIndex(template_name)
	for i, template in pairs(NewsFeedTemplates) do
		if template.name == template_name then
			return i
		end
	end
end
