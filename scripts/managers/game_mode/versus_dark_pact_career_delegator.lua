-- chunkname: @scripts/managers/game_mode/versus_dark_pact_career_delegator.lua

VersusDarkPactCareerDelegator = class(VersusDarkPactCareerDelegator)

VersusDarkPactCareerDelegator.init = function (self)
	self._available_careers = {}
end

VersusDarkPactCareerDelegator._generate_careers = function (self)
	local game_mode = Managers.state.game_mode:game_mode()
	local settings = game_mode:settings()
	local available_careers = self._available_careers

	table.clear(available_careers)

	local dark_pact_profile_order = settings.dark_pact_profile_order

	for i = 1, #dark_pact_profile_order do
		available_careers[i] = dark_pact_profile_order[i]
	end

	table.shuffle(available_careers)
end

local picked_careers = {}

VersusDarkPactCareerDelegator.request_careers = function (self)
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

		if not ignore_careers[potential_career] and PlayerUtils.is_career_available(potential_career) then
			career = table.remove(available_careers, dupe_check_i)
			ignore_careers[career] = true

			break
		end
	end

	return career
end
