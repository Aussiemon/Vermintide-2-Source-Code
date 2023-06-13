PassiveAbilityQuestingKnight = class(PassiveAbilityQuestingKnight)
local NUM_CHALLENGES = 2
local CHALLENGE_CATEGORY = "questing_knight"

local function has_loot_objective(objective)
	local level_transition_handler = Managers.level_transition_handler
	local level_key = level_transition_handler:get_current_level_keys()
	local level_settings = level_key and LevelSettings[level_key]
	local loot_objectives = level_settings and level_settings.loot_objectives

	return loot_objectives and loot_objectives[objective] and loot_objectives[objective] > 0
end

local function only_when_tomes_allowed_and_there_from_the_start()
	return not Managers.state.game_mode:is_round_started() and has_loot_objective("tome")
end

local function only_when_grims_allowed_and_there_from_the_start()
	return not Managers.state.game_mode:is_round_started() and has_loot_objective("grimoire")
end

local challenge_settings = {
	default = {
		possible_challenges = {
			{
				reward = "markus_questing_knight_passive_power_level",
				type = "kill_elites",
				amount = {
					1,
					15,
					15,
					20,
					20,
					30,
					30,
					30
				}
			},
			{
				reward = "markus_questing_knight_passive_attack_speed",
				type = "kill_specials",
				amount = {
					1,
					10,
					10,
					15,
					15,
					20,
					20,
					20
				}
			},
			{
				reward = "markus_questing_knight_passive_cooldown_reduction",
				type = "kill_monsters",
				amount = {
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1
				}
			},
			{
				reward = "markus_questing_knight_passive_health_regen",
				type = "find_grimoire",
				amount = {
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1
				},
				condition = only_when_grims_allowed_and_there_from_the_start
			},
			{
				reward = "markus_questing_knight_passive_damage_taken",
				type = "find_tome",
				amount = {
					1,
					1,
					1,
					1,
					1,
					1,
					1,
					1
				},
				condition = only_when_tomes_allowed_and_there_from_the_start
			}
		},
		side_quest_challenge = {
			reward = "markus_questing_knight_passive_strength_potion",
			type = "kill_enemies",
			amount = {
				1,
				100,
				125,
				150,
				175,
				200,
				200,
				200
			}
		}
	}
}

for _, dlc in pairs(DLCSettings) do
	if dlc.questing_knight_challenges then
		table.merge_recursive(challenge_settings, dlc.questing_knight_challenges)
	end
end

PassiveAbilityQuestingKnight.init = function (self, extension_init_context, unit, extension_init_data, ability_init_data)
	self._owner_unit = unit
	self._player = extension_init_data.player
	self._is_server = extension_init_context.is_server
	self._player_unique_id = extension_init_data.player:unique_id()
end

PassiveAbilityQuestingKnight.extensions_ready = function (self, world, unit)
	if not self._is_server then
		return
	end

	local level_transition_handler = Managers.level_transition_handler
	local level_key = level_transition_handler:get_current_level_keys()
	local level_settings = level_key and LevelSettings[level_key]
	local is_hub_level = level_settings and level_settings.hub_level

	if is_hub_level then
		return
	end

	self._is_hub_level = is_hub_level
	local difficulty = Managers.state.difficulty:get_difficulty()
	self._difficulty_rank = DifficultySettings[difficulty].rank
	self._buff_extension = ScriptUnit.extension(unit, "buff_system")
	self._talent_extension = ScriptUnit.extension(unit, "talent_system")

	if self._talent_extension:initial_talent_synced() then
		self:_create_quests()
	else
		self:_register_events()
	end
end

PassiveAbilityQuestingKnight._create_quests = function (self)
	local challenge_manager = Managers.venture.challenge
	local player_unique_id = self._player_unique_id
	local status = Managers.party:get_status_from_unique_id(player_unique_id)
	local health_state = status.game_mode_data.health_state
	local respawning = health_state == "respawning"

	if not respawning and self:_always_reset_quest_pool() then
		challenge_manager:remove_filtered_challenges(CHALLENGE_CATEGORY, player_unique_id)
	end

	local passive_challenges = challenge_manager:get_challenges_filtered({}, CHALLENGE_CATEGORY, player_unique_id)
	local num_existing_challenges = #passive_challenges

	if num_existing_challenges > 0 then
		for i = 1, num_existing_challenges do
			passive_challenges[i]:set_paused(false)
		end
	else
		local completed_challenges = challenge_manager:get_completed_challenges_filtered({}, CHALLENGE_CATEGORY, player_unique_id)

		if #completed_challenges == 0 then
			local challenge_list = self:_generate_quest_pool()

			self:_start_quest_from_pool(challenge_list, NUM_CHALLENGES)

			if self._talent_extension:has_talent("markus_questing_knight_passive_additional_quest") then
				self:_start_quest_from_pool(challenge_list, 1)
			end

			if self._talent_extension:has_talent("markus_questing_knight_passive_side_quest") then
				local side_quest_challenge = self:_get_side_quest_challenge()

				challenge_manager:add_challenge(side_quest_challenge.type, true, CHALLENGE_CATEGORY, side_quest_challenge.reward, player_unique_id, side_quest_challenge.amount[self._difficulty_rank])
			end
		end
	end
end

PassiveAbilityQuestingKnight._generate_quest_pool = function (self)
	local challenge_list = table.clone(self:_get_possible_challenges())

	return challenge_list
end

PassiveAbilityQuestingKnight._get_possible_challenges = function (self)
	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local settings = challenge_settings[mechanism_name] or challenge_settings.default
	local possible_challenges = settings.possible_challenges

	fassert(possible_challenges, "[PassiveAbilityQuestingKnight] possible_challenges not defined for the current mechanism")

	local filtered_challenges = {}

	for possible_challenges_index = 1, #possible_challenges do
		local possible_challenge = possible_challenges[possible_challenges_index]

		if not possible_challenge.condition or possible_challenge.condition() then
			filtered_challenges[#filtered_challenges + 1] = possible_challenge
		end
	end

	return filtered_challenges
end

PassiveAbilityQuestingKnight._get_side_quest_challenge = function (self)
	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local settings = challenge_settings[mechanism_name] or challenge_settings.default
	local side_quest_challenge = settings.side_quest_challenge

	fassert(side_quest_challenge, "[PassiveAbilityQuestingKnight] side_quest_challenge not defined for the current mechanism")

	return side_quest_challenge
end

PassiveAbilityQuestingKnight._always_reset_quest_pool = function (self)
	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local settings = challenge_settings[mechanism_name] or challenge_settings.default

	return settings.always_reset_quest_pool or false
end

PassiveAbilityQuestingKnight._start_quest_from_pool = function (self, quest_pool, num_to_start)
	local challenge_manager = Managers.venture.challenge
	local difficulty_rank = self._difficulty_rank
	local num_available_challenges = #quest_pool

	for i = 1, num_to_start do
		if num_available_challenges == 0 then
			print("PassiveAbilityQuestingKnight: Not enought challenges, requested", num_to_start)

			break
		end

		local challenge_to_add_id = math.random(num_available_challenges)
		local challenge_to_add = quest_pool[challenge_to_add_id]
		local challenge_reward = challenge_to_add.reward

		if self._talent_extension:has_talent("markus_questing_knight_passive_improved_reward") then
			challenge_reward = challenge_reward .. "_improved"
		end

		challenge_manager:add_challenge(challenge_to_add.type, false, "questing_knight", challenge_reward, self._player_unique_id, challenge_to_add.amount[difficulty_rank])
		table.swap_delete(quest_pool, challenge_to_add_id)

		num_available_challenges = num_available_challenges - 1
	end
end

PassiveAbilityQuestingKnight.on_initial_talents_synced = function (self, talent_extension)
	if self._talent_extension == talent_extension then
		if not self._is_server or self._is_hub_level then
			return
		end

		self:_create_quests()
		self:_unregister_events()
	end
end

PassiveAbilityQuestingKnight.destroy = function (self)
	self:_unregister_events()
end

PassiveAbilityQuestingKnight._register_events = function (self)
	Managers.state.event:register(self, "on_initial_talents_synced", "on_initial_talents_synced")
end

PassiveAbilityQuestingKnight._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		Managers.state.event:unregister("on_initial_talents_synced", self)
	end
end
