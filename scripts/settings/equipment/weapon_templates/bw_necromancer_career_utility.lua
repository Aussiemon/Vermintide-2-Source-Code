local function _can_command(action_user)
	local commander_extension = ScriptUnit.extension(action_user, "ai_commander_system")

	return commander_extension:get_controlled_units_count() > 0
end

local function _can_command_stand(action_user)
	if not _can_command(action_user) then
		return false
	end

	local commander_extension = ScriptUnit.extension(action_user, "ai_commander_system")
	local num_valid_units = commander_extension:get_controlled_units_count()
	local controlled_units = commander_extension:get_controlled_units()

	for controlled_unit in pairs(controlled_units) do
		local breed = Unit.get_data(controlled_unit, "breed")

		if breed and breed.name == "pet_skeleton_armored" then
			num_valid_units = num_valid_units - 1
		end
	end

	return num_valid_units > 0
end

local function _can_attack(action_user)
	if not _can_command(action_user) then
		return false
	end

	local has_commandable_pet = false
	local commander_extension = ScriptUnit.extension(action_user, "ai_commander_system")

	for controlled_unit in pairs(commander_extension:get_controlled_units()) do
		local breed = Unit.get_data(controlled_unit, "breed")

		if breed.name ~= "pet_skeleton_with_shield" then
			has_commandable_pet = true

			break
		end
	end

	if not has_commandable_pet then
		return false
	end

	local has_calculated_target = ActionCareerBWNecromancerCommandAttack.pre_calculate_target(action_user)

	if not has_calculated_target then
		return false
	end

	return true
end

local function _can_sacrifice(action_user, input_extension)
	if not _can_command(action_user) then
		return false
	end

	local commander_extension = ScriptUnit.extension(action_user, "ai_commander_system")
	local any_alive = false

	for pet_unit in pairs(commander_extension:get_controlled_units()) do
		if HEALTH_ALIVE[pet_unit] then
			any_alive = true

			break
		end
	end

	if not any_alive then
		return false
	end

	local talent_extension = ScriptUnit.has_extension(action_user, "talent_system")

	if talent_extension and talent_extension:has_talent("sienna_necromancer_4_1") then
		return true
	end

	return true
end

local function _can_cancel_command(action_user, input_extension)
	local commander_extension = ScriptUnit.extension(action_user, "ai_commander_system")
	local any_alive = false

	for pet_unit in pairs(commander_extension:get_controlled_units()) do
		if HEALTH_ALIVE[pet_unit] then
			local command_state = commander_extension:command_state(pet_unit)

			if command_state ~= CommandStates.Following then
				return true
			end
		end
	end

	return false
end

local weapon_template = {
	actions = {
		action_one = {
			default = {
				kind = "career_bw_necromancer_command_attack",
				weapon_action_hand = "left",
				anim_event = "pet_control_target_command",
				total_time = 0.2,
				chain_condition_func = _can_attack,
				condition_func = _can_attack,
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.2,
						action = "weapon_reload",
						input = "weapon_reload"
					}
				}
			},
			cast_stand = {
				anim_event = "pet_control_target_command",
				weapon_action_hand = "left",
				kind = "career_bw_necromancer_command_stand",
				total_time = 1,
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.2,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.3,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.5,
						action = "action_two",
						release_required = "action_two_hold",
						input = "action_two"
					},
					{
						sub_action = "default",
						start_time = 0.2,
						action = "weapon_reload",
						input = "weapon_reload"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					input_extension:clear_input_buffer()

					return input_extension:reset_release_input()
				end
			}
		},
		action_two = {
			default = {
				kind = "action_selector",
				weapon_action_hand = "left",
				conditional_actions = {
					{
						sub_action = "command_stand",
						release_required = "action_two_hold",
						condition = function (talent_extension, buff_extension, weapon_extension, owner_unit)
							return _can_command_stand(owner_unit)
						end
					}
				},
				default_action = {
					action = "action_two",
					sub_action = "dummy"
				}
			},
			command_stand = {
				weapon_action_hand = "left",
				anim_end_event = "pet_control_cancel",
				kind = "career_bw_necromancer_command_stand_targeting",
				hold_input = "action_two_hold",
				anim_event = "pet_control_target",
				minimum_hold_time = 0.3,
				anim_end_event_condition_func = function (unit, end_reason)
					return end_reason ~= "new_interupting_action"
				end,
				total_time = math.huge,
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "cast_stand",
						start_time = 0.2,
						action = "action_one",
						input = "action_one"
					},
					{
						sub_action = "default",
						start_time = 0.2,
						action = "weapon_reload",
						input = "weapon_reload"
					}
				},
				enter_function = function (attacker_unit, input_extension)
					local commander_extension = ScriptUnit.extension(attacker_unit, "ai_commander_system")
					local controlled_units = commander_extension:get_controlled_units()

					for pet_unit in pairs(controlled_units) do
						if HEALTH_ALIVE[pet_unit] then
							commander_extension:cancel_current_command(pet_unit, true)
						end
					end
				end
			},
			dummy = {
				kind = "dummy",
				weapon_action_hand = "left",
				total_time = 0,
				allowed_chain_actions = {}
			}
		},
		weapon_reload = {
			default = {
				anim_event = "pet_control_sacrifice",
				weapon_action_hand = "left",
				kind = "career_bw_necromancer_command_vent",
				total_time = 1,
				condition_func = _can_sacrifice,
				chain_condition_func = _can_sacrifice,
				allowed_chain_actions = {
					{
						sub_action = "default",
						start_time = 0.9,
						action = "action_wield",
						input = "action_wield"
					},
					{
						sub_action = "default",
						start_time = 0.9,
						action = "action_two",
						input = "action_two_hold"
					},
					{
						sub_action = "default",
						start_time = 0.9,
						action = "action_one",
						input = "action_one"
					}
				}
			}
		},
		action_inspect = ActionTemplates.action_inspect_left,
		action_wield = ActionTemplates.wield_left
	},
	left_hand_unit = "units/weapons/player/wpn_bw_necromancer_ability/wpn_bw_necromancer_ability",
	left_hand_attachment_node_linking = AttachmentNodeLinking.one_handed_melee_weapon.left,
	wield_anim = "to_necro_command_item",
	state_machine = "units/beings/player/first_person_base/state_machines/career/skill_necromancer",
	load_state_machine = false,
	display_unit = "units/weapons/weapon_display/display_staff",
	crosshair_style = "default",
	buff_type = "RANGED_ABILITY",
	weapon_type = "RANGED_ABILITY",
	dodge_count = 2,
	buffs = {
		change_dodge_distance = {
			external_optional_multiplier = 1
		},
		change_dodge_speed = {
			external_optional_multiplier = 1
		}
	},
	is_utility_weapon = true,
	is_command_utility_weapon = true,
	wwise_dep_left_hand = {
		"wwise/two_handed_swords"
	}
}

return {
	bw_necromancer_career_utility_weapon = table.clone(weapon_template)
}
