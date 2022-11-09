BackendInterfaceCommon = class(BackendInterfaceCommon)

require("scripts/settings/equipment/weapon_skins")

BackendInterfaceCommon.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
end

BackendInterfaceCommon.ready = function (self)
	return true
end

BackendInterfaceCommon.can_wield = function (self, career_name, item_data)
	local can_wield = item_data.can_wield

	assert(can_wield, "BackendInterfaceCommon - Item %q has not specified what profiles that can use it.", item_data.name or "(item_data missing name)")

	for _, wield_career_name in ipairs(can_wield) do
		if career_name == wield_career_name then
			return true
		end
	end
end

local filter_operators = {
	not = {
		4,
		1,
		function (op1)
			return not op1
		end
	},
	["<"] = {
		3,
		2,
		function (op1, op2)
			return op1 < op2
		end
	},
	[">"] = {
		3,
		2,
		function (op1, op2)
			return op2 < op1
		end
	},
	["<="] = {
		3,
		2,
		function (op1, op2)
			return op1 <= op2
		end
	},
	[">="] = {
		3,
		2,
		function (op1, op2)
			return op2 <= op1
		end
	},
	["~="] = {
		3,
		2,
		function (op1, op2)
			return op1 ~= op2
		end
	},
	["=="] = {
		3,
		2,
		function (op1, op2)
			return op1 == op2
		end
	},
	and = {
		2,
		2,
		function (op1, op2)
			return op1 and op2
		end
	},
	or = {
		1,
		2,
		function (op1, op2)
			return op1 or op2
		end
	}
}

local function make_filter_macro_can_wield_profile(profile_name)
	return function (item, backend_id)
		local careers = SPProfiles[FindProfileIndex(profile_name)].careers

		for _, career in ipairs(careers) do
			if table.contains(item.data.can_wield, career.name) then
				return true
			end
		end

		return false
	end
end

local function make_filter_macro_can_wield_career(career_name)
	return function (item, backend_id)
		return table.contains(item.data.can_wield, career_name)
	end
end

local filter_macros = {
	item_key = function (item, backend_id)
		local item_data = item.data

		return item_data.key
	end,
	item_rarity = function (item, backend_id)
		local item_data = item.data
		local backend_items = Managers.backend:get_interface("items")
		local rarity = backend_items:get_item_rarity(backend_id)

		return rarity
	end,
	slot_type = function (item, backend_id)
		local item_data = item.data

		return item_data.slot_type
	end,
	item_type = function (item, backend_id)
		local item_data = item.data

		return item_data.item_type
	end,
	chest_category = function (item, backend_id)
		local item_data = item.data

		return item_data.chest_category
	end,
	discounted_items = function (item, backend_id)
		local item_data = item.data
		local item_key = item_data.key
		local backend_peddler = Managers.backend:get_interface("peddler")
		local steam_itemdefid = item_data.steam_itemdefid

		if HAS_STEAM and steam_itemdefid then
			local steam_data = item.steam_data

			if steam_data and steam_data.discount_is_active then
				return true
			end
		end

		return backend_peddler:is_discounted_shilling_item(item_key)
	end,
	trinket_as_hero = function (item, backend_id)
		local item_data = item.data

		if item_data.traits then
			for _, trait_name in ipairs(item_data.traits) do
				local trait_config = BuffTemplates[trait_name]
				local roll_dice_as_hero = trait_config.roll_dice_as_hero

				if roll_dice_as_hero then
					return true
				end
			end
		end
	end,
	is_weapon = function (item, backend_id)
		local item_data = item.data
		local slot_type = item_data.slot_type
		local is_weapon = slot_type == "melee" or slot_type == "ranged"

		return is_weapon
	end,
	equipped_by_current_career = function (item, backend_id, params)
		local item_data = item.data
		local profile_synchronizer = Managers.state.network.profile_synchronizer
		local player = nil

		if params and params.player then
			player = params.player
		else
			player = Managers.player:local_player()
		end

		if not player then
			return false
		end

		local profile_index = player:profile_index()

		if not profile_index or profile_index == 0 then
			return false
		end

		local career_index = player:career_index()

		if not career_index or career_index == 0 then
			return false
		end

		local hero_data = SPProfiles[profile_index]
		local career_data = hero_data.careers[career_index]
		local career_name = career_data.name
		local backend_items = Managers.backend:get_interface("items")
		local career_names = backend_items:equipped_by(backend_id)

		return table.contains(career_names, career_name)
	end,
	is_equipped = function (item, backend_id)
		local item_data = item.data
		local backend_items = Managers.backend:get_interface("items")
		local career_names = backend_items:equipped_by(backend_id)

		if #career_names > 0 then
			return true
		end

		return false
	end,
	is_equipment_slot = function (item, backend_id)
		local item_data = item.data
		local is_slot = false

		for _, slot in ipairs(InventorySettings.equipment_slots) do
			if item_data.slot_type == slot.type then
				is_slot = true

				break
			end
		end

		return is_slot
	end,
	current_hero = function (item, backend_id)
		local item_data = item.data
		local profile_synchronizer = Managers.state.network.profile_synchronizer
		local player = Managers.player:local_player()
		local profile_index = profile_synchronizer:profile_by_peer(player:network_id(), player:local_player_id())
		local hero_data = SPProfiles[profile_index]
		local hero_name = hero_data.display_name

		return hero_name
	end,
	can_wield_by_current_career = function (item, backend_id, params)
		local item_data = item.data
		local profile_synchronizer = Managers.state.network.profile_synchronizer
		local player = Managers.player:local_player()
		local profile_index = (params and params.profile_index) or player:profile_index()
		local career_index = (params and params.career_index) or player:career_index()
		local hero_data = SPProfiles[profile_index]
		local career_data = hero_data.careers[career_index]
		local career_name = career_data.name
		local item_can_wield = item_data.can_wield

		return table.contains(item_can_wield, career_name)
	end,
	can_wield_by_current_hero = function (item, backend_id, params)
		local item_data = item.data
		local profile_synchronizer = Managers.state.network.profile_synchronizer
		local player = Managers.player:local_player()
		local profile_index = (params and params.profile_index) or player:profile_index()
		local career_index = (params and params.career_index) or player:career_index()
		local hero_data = SPProfiles[profile_index]
		local careers = hero_data.careers
		local item_can_wield = item_data.can_wield

		for career_index, career in ipairs(careers) do
			local career_name = career.name

			if table.contains(item_can_wield, career_name) then
				return true
			end
		end

		return false
	end,
	can_wield_bright_wizard = make_filter_macro_can_wield_profile("bright_wizard"),
	can_wield_bw_scholar = make_filter_macro_can_wield_career("bw_scholar"),
	can_wield_bw_adept = make_filter_macro_can_wield_career("bw_adept"),
	can_wield_bw_unchained = make_filter_macro_can_wield_career("bw_unchained"),
	can_wield_dwarf_ranger = make_filter_macro_can_wield_profile("dwarf_ranger"),
	can_wield_dr_ironbreaker = make_filter_macro_can_wield_career("dr_ironbreaker"),
	can_wield_dr_slayer = make_filter_macro_can_wield_career("dr_slayer"),
	can_wield_dr_ranger = make_filter_macro_can_wield_career("dr_ranger"),
	can_wield_dr_engineer = make_filter_macro_can_wield_career("dr_engineer"),
	can_wield_empire_soldier = make_filter_macro_can_wield_profile("empire_soldier"),
	can_wield_es_huntsman = make_filter_macro_can_wield_career("es_huntsman"),
	can_wield_es_knight = make_filter_macro_can_wield_career("es_knight"),
	can_wield_es_mercenary = make_filter_macro_can_wield_career("es_mercenary"),
	can_wield_es_questingknight = make_filter_macro_can_wield_career("es_questingknight"),
	can_wield_witch_hunter = make_filter_macro_can_wield_profile("witch_hunter"),
	can_wield_wh_captain = make_filter_macro_can_wield_career("wh_captain"),
	can_wield_wh_bountyhunter = make_filter_macro_can_wield_career("wh_bountyhunter"),
	can_wield_wh_zealot = make_filter_macro_can_wield_career("wh_zealot"),
	can_wield_wood_elf = make_filter_macro_can_wield_profile("wood_elf"),
	can_wield_we_waywatcher = make_filter_macro_can_wield_career("we_waywatcher"),
	can_wield_we_maidenguard = make_filter_macro_can_wield_career("we_maidenguard"),
	can_wield_we_shade = make_filter_macro_can_wield_career("we_shade"),
	can_wield_we_thornsister = make_filter_macro_can_wield_career("we_thornsister"),
	player_owns_item_key = function (item, backend_id)
		local item_data = item.data
		local backend_items = Managers.backend:get_interface("items")
		local all_items = backend_items:get_all_backend_items()

		for backend_id, config in pairs(all_items) do
			if item_data.key == config.key then
				return true
			end
		end

		return false
	end,
	can_salvage = function (item, backend_id)
		local item_data = item.data
		local slot_type = item_data.slot_type

		if slot_type == "ranged" or slot_type == "melee" or slot_type == "ring" or slot_type == "necklace" or slot_type == "trinket" then
			local backend_items = Managers.backend:get_interface("items")
			local rarity = backend_items:get_item_rarity(backend_id)

			if rarity ~= "default" and rarity ~= "promo" and rarity ~= "magic" then
				local career_names = backend_items:equipped_by(backend_id)

				if #career_names == 0 then
					local is_favorited = ItemHelper.is_favorite_backend_id(backend_id, item)

					return not is_favorited
				end
			end
		end

		return false
	end,
	has_properties = function (item, backend_id)
		if item.properties then
			return true
		end

		return false
	end,
	has_traits = function (item, backend_id)
		if item.traits then
			return true
		end

		return false
	end,
	has_applied_skin = function (item, backend_id)
		local item_data = item.data
		local slot_type = item_data.slot_type

		if item.skin and slot_type ~= "weapon_skin" then
			return true
		end

		return false
	end,
	can_apply_skin = function (item, backend_id)
		local item_data = item.data
		local slot_type = item_data.slot_type

		if slot_type == "ranged" or slot_type == "melee" then
			local backend_items = Managers.backend:get_interface("items")
			local rarity = backend_items:get_item_rarity(backend_id)

			if rarity == "magic" then
				return false
			end

			local backend_crafting = Managers.backend:get_interface("crafting")
			local skin_combination_table_key = item_data.skin_combination_table

			if skin_combination_table_key then
				local weapon_skin_combinations_tables = WeaponSkins.skin_combinations[skin_combination_table_key]
				local unlocked_weapon_skins = backend_crafting:get_unlocked_weapon_skins()
				local default_skin = WeaponSkins.default_skins[item.ItemId]

				if unlocked_weapon_skins[default_skin] then
					return true
				end

				for _, weapon_skins in pairs(weapon_skin_combinations_tables) do
					for _, skin in ipairs(weapon_skins) do
						if unlocked_weapon_skins[skin] then
							return true
						end
					end
				end
			end
		end

		return false
	end,
	can_upgrade = function (item, backend_id)
		local item_data = item.data
		local slot_type = item_data.slot_type

		if slot_type == "ranged" or slot_type == "melee" or slot_type == "ring" or slot_type == "necklace" or slot_type == "trinket" then
			local backend_items = Managers.backend:get_interface("items")
			local rarity = backend_items:get_item_rarity(backend_id)

			if rarity == "plentiful" or rarity == "common" or rarity == "rare" or rarity == "exotic" then
				return true
			end
		end
	end,
	can_craft_with = function (item, backend_id)
		local item_data = item.data
		local slot_type = item_data.slot_type

		if slot_type == "ranged" or slot_type == "melee" or slot_type == "ring" or slot_type == "necklace" or slot_type == "trinket" then
			local backend_items = Managers.backend:get_interface("items")
			local rarity = backend_items:get_item_rarity(backend_id)

			if rarity == "default" then
				return true
			end
		end
	end,
	available_in_mechanism_versus = function (item, backend_id)
		local item_data = item.data
		local mechanisms = item_data.mechanisms
		local is_cosmetic = table.contains({
			"hat",
			"weapon_skin",
			"frame",
			"skin"
		}, item_data.slot_type)

		return is_cosmetic or (mechanisms and table.contains(mechanisms, "versus"))
	end,
	available_in_mechanism_adventure = function (item, backend_id)
		local item_data = item.data
		local mechanisms = item_data.mechanisms
		local is_cosmetic = table.contains({
			"hat",
			"weapon_skin",
			"frame",
			"skin"
		}, item_data.slot_type)

		return is_cosmetic or not mechanisms or table.contains(mechanisms, "adventure")
	end,
	available_in_current_mechanism = function (item, backend_id)
		if script_data.disable_mechanism_item_filter then
			return true
		end

		local item_data = item.data
		local mechanisms = item_data.mechanisms
		local current_mechanism = Managers.mechanism:current_mechanism_name()
		local is_cosmetic = table.contains({
			"hat",
			"weapon_skin",
			"frame",
			"skin"
		}, item_data.slot_type)

		return is_cosmetic or (mechanisms and table.contains(mechanisms, current_mechanism)) or (not mechanisms and Managers.mechanism:mechanism_setting("default_inventory"))
	end,
	owned = function (item, backend_id)
		local owned = item.owned

		return owned
	end,
	is_fake_item = function (item, backend_id)
		local item_interface = Managers.backend:get_interface("items")
		local fake_items = item_interface:get_all_fake_backend_items()

		if fake_items[backend_id] then
			return true
		end
	end
}
BackendInterfaceCommon.filter_postfix_cache = BackendInterfaceCommon.filter_postfix_cache or {}
local empty_params = {}

BackendInterfaceCommon.filter_items = function (self, items, filter_infix, params)
	local filter_postfix = BackendInterfaceCommon.filter_postfix_cache[filter_infix]

	if not filter_postfix then
		filter_postfix = self:_infix_to_postfix_item_filter(filter_infix)
		BackendInterfaceCommon.filter_postfix_cache[filter_infix] = filter_postfix
	end

	local item_master_list = ItemMasterList
	local stack = {}
	local passed = {}

	for backend_id, item in pairs(items) do
		local key = item.key
		local item_data = item_master_list[key]

		table.clear(stack)

		for i = 1, #filter_postfix, 1 do
			local token = filter_postfix[i]

			if filter_operators[token] then
				local num_params = filter_operators[token][2]
				local op_func = filter_operators[token][3]
				local op1 = table.remove(stack)

				if num_params == 1 then
					stack[#stack + 1] = op_func(op1)
				else
					local op2 = table.remove(stack)
					stack[#stack + 1] = op_func(op1, op2)
				end
			else
				local macro_func = filter_macros[token]

				if macro_func then
					stack[#stack + 1] = macro_func(item, backend_id, params or empty_params)
				else
					stack[#stack + 1] = token
				end
			end
		end

		if stack[1] == true then
			local item = table.clone(item)
			passed[#passed + 1] = item
		end
	end

	return passed
end

BackendInterfaceCommon._infix_to_postfix_item_filter = function (self, filter_infix)
	local output = {}
	local stack = {}

	for token in string.gmatch(filter_infix, "%S+") do
		if filter_operators[token] then
			while #stack > 0 do
				local top = stack[#stack]

				if filter_operators[top] and filter_operators[token][1] <= filter_operators[top][1] then
					output[#output + 1] = table.remove(stack)
				else
					break
				end
			end

			stack[#stack + 1] = token
		elseif token == "(" then
			stack[#stack + 1] = "("
		elseif token == ")" then
			while #stack > 0 do
				local top = stack[#stack]

				if top ~= "(" then
					output[#output + 1] = table.remove(stack)
				else
					stack[#stack] = nil

					break
				end
			end
		else
			output[#output + 1] = token
		end
	end

	while #stack > 0 do
		output[#output + 1] = table.remove(stack)
	end

	for i = 1, #output, 1 do
		local token = output[i]

		if token == "true" then
			output[i] = true
		elseif token == "false" then
			output[i] = false
		elseif tonumber(token) then
			output[i] = tonumber(token)
		end
	end

	return output
end

BackendInterfaceCommon.serialize_traits = function (self, traits)
	local serialized_traits = ""

	for id, trait_data in pairs(traits) do
		local trait_name = trait_data.trait_name
		local serialized = trait_name

		for variable_name, value in pairs(trait_data) do
			if variable_name ~= "trait_name" then
				serialized = serialized .. string.format(",%s,%.3f", variable_name, value)
			end
		end

		serialized = serialized .. ";"
		serialized_traits = serialized_traits .. serialized
	end

	return serialized_traits
end

BackendInterfaceCommon.serialize_runes = function (self, runes)
	local serialized_runes = ""

	for id, rune_data in pairs(runes) do
		local rune_slot = rune_data.rune_slot
		local rune_value = rune_data.rune
		local serialized = rune_slot .. string.format(",%s,%.3f", rune_value, 0) .. ";"
		serialized_runes = serialized_runes .. serialized
	end

	return serialized_runes
end

BackendInterfaceCommon.commit_load_time_data = function (self, load_time_data)
	if Managers.account:offline_mode() then
		return
	end

	local human_players = Managers.player:human_players()
	local collected_players = {}
	local platform_id, name = nil

	for unique_id, player in pairs(human_players) do
		platform_id = player:platform_id()

		if not IS_XB1 then
			platform_id = Application.hex64_to_dec(platform_id)
		end

		name = player:cached_name()

		if not name or name == "" then
			name = player:name()
		end

		collected_players[#collected_players + 1] = {
			platform_id = platform_id,
			name = name,
			career = player:career_name()
		}
	end

	local request = {
		FunctionName = "reportTimer",
		FunctionParameter = {
			identifier = load_time_data.identifier,
			duration = load_time_data.duration,
			parameters = load_time_data.parameters,
			players = collected_players
		}
	}
	local mirror = self._backend_mirror
	local request_queue = mirror:request_queue()

	request_queue:enqueue(request, function ()
		print("Commit load time data")
	end, false)
end

return
