-- chunkname: @scripts/managers/game_mode/versus_dark_pact_career_delegator.lua

VersusDarkPactCareerDelegator = class(VersusDarkPactCareerDelegator)

VersusDarkPactCareerDelegator.init = function (self)
	self._available_careers = {}
	self._is_playable_boss_next = false
end

VersusDarkPactCareerDelegator._generate_careers = function (self)
	local game_mode = Managers.state.game_mode:game_mode()
	local settings = game_mode:settings()
	local available_careers = self._available_careers

	table.clear(available_careers)

	local dark_pact_profile_order = settings.dark_pact_profile_order

	for i = 1, #dark_pact_profile_order do
		local career = dark_pact_profile_order[i]

		if PlayerUtils.get_career_override(career) then
			available_careers[#available_careers + 1] = career
		end
	end

	table.shuffle(available_careers)
end

local picked_careers = {}

VersusDarkPactCareerDelegator.request_careers = function (self, is_bot)
	local game_mode = Managers.state.game_mode:game_mode()
	local settings = game_mode:settings()
	local careers = {}
	local num_to_return = settings.dark_pact_picking_rules.special_pick_options

	table.clear(picked_careers)

	for i = 1, num_to_return do
		local career = self:_get_available_career(picked_careers)

		if not career then
			return careers, "all"
		end

		careers[i] = career
	end

	if not is_bot and self._is_playable_boss_next then
		local bosses = GameModeSettings.versus.dark_pact_boss_profiles
		local random_boss_profile = table.random(bosses)

		careers[#careers + 1] = random_boss_profile

		self:set_is_playable_boss_next(false)
	end

	return careers, "all"
end

VersusDarkPactCareerDelegator._get_available_career = function (self, ignore_careers)
	local available_careers = self._available_careers

	if table.is_empty(available_careers) then
		self:_generate_careers()
	end

	local career

	for dupe_check_i = #available_careers, 1, -1 do
		local potential_career = available_careers[dupe_check_i]

		if not ignore_careers[potential_career] then
			career = table.remove(available_careers, dupe_check_i)
			ignore_careers[career] = true

			break
		end
	end

	return career
end

VersusDarkPactCareerDelegator.set_is_playable_boss_next = function (self, bool)
	self._is_playable_boss_next = bool
end

VersusDarkPactCareerDelegator.get_is_playable_boss_next = function (self)
	return self._is_playable_boss_next
end
