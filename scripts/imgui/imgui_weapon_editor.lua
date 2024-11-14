-- chunkname: @scripts/imgui/imgui_weapon_editor.lua

rawset(_G, "DamageProfileTemplates_orig", nil)
rawset(_G, "BoostCurves_orig", nil)
rawset(_G, "PowerLevelTemplates_orig", nil)
rawset(_G, "AttackTemplates_orig", nil)
rawset(_G, "Weapons_orig", nil)

local type = type

local function clone(t)
	return setmetatable({}, {
		__mode = "kv",
		__index = function (m, x)
			local t = type(x)

			if t == "function" then
				return nil
			end

			if t ~= "table" then
				return x
			end

			local c = {}

			for k, v in pairs(x) do
				c[k] = m[v]
			end

			m[t] = c

			return c
		end,
	})[t]
end

local function diff(x, ref, b)
	if x == ref then
		return nil, b
	end

	local t = type(x)

	if t == "function" then
		return nil, b
	end

	if t ~= "table" or type(ref) ~= "table" then
		return x, true
	end

	local d, bb = {}, false

	for k, v in pairs(x) do
		d[k], bb = diff(v, ref[k], bb)
	end

	if not bb then
		d = nil
	end

	return d, b or bb
end

local function accumulate(f)
	local t = {}

	f(function (v)
		t[#t + 1] = v
	end)

	return t
end

ImguiWeaponEditor = class(ImguiWeaponEditor)

ImguiWeaponEditor.init = function (self)
	self._persistent = false
	self._tabs = {
		BoostCurves = BoostCurves,
		DamageProfileTemplates = DamageProfileTemplates,
		PowerLevelTemplates = PowerLevelTemplates,
		AttackTemplates = AttackTemplates,
		Weapons = Weapons,
		TerrorEventBlueprints = TerrorEventBlueprints,
	}
	self._table_metadata = setmetatable({}, {
		__mode = "k",
		__index = function (t, k)
			local keys = table.keys(k)

			table.sort(keys)

			local v = {
				new_key = "",
				new_value = "",
				keys = keys,
			}

			t[k] = v

			return v
		end,
	})

	self:checkpoint()
end

ImguiWeaponEditor._defered_init = function (self)
	if self._defered_init_done then
		return
	end

	local sorted_anims = {}

	for i = 1, #NetworkLookup.anims do
		sorted_anims[i] = NetworkLookup.anims[i]
	end

	table.sort(sorted_anims)

	self._lut_lut = {
		anim_end_event = sorted_anims,
		anim_event = sorted_anims,
		attack_template = table.keys(AttackTemplates),
		boost_curve_type = table.keys(BoostCurves),
		buff_name = {
			"planted_charging_decrease_movement",
			"planted_decrease_movement",
			"planted_fast_decrease_movement",
		},
		buff_type = NetworkLookup.buff_weapon_types,
		crosshair_style = {
			"dot",
			"default",
			"arrows",
			"circle",
			"shotgun",
			"projectile",
		},
		damage_profile = table.keys(AttackTemplates),
		damage_type = NetworkLookup.damage_types,
		display_unit = accumulate(function (yield)
			for _, d in pairs(WeaponSkins.skins) do
				if d.data and d.data.display_unit then
					yield(d.data.display_unit)
				end
			end
		end),
		first_person_hit_anim = sorted_anims,
		hit_effect = table.keys(MaterialEffectMappings),
		hit_stop_anim = sorted_anims,
		kind = {
			"career_aim",
			"career_dummy",
			"career_true_flight_aim",
			"charge",
			"dummy",
			"melee_start",
			"wield",
			"bounty_hunter_handgun",
			"handgun",
			"interaction",
			"self_interaction",
			"push_stagger",
			"sweep",
			"block",
			"throw",
			"staff",
			"bow",
			"true_flight_bow",
			"true_flight_bow_aim",
			"crossbow",
			"cancel",
			"buff",
			"bullet_spray",
			"aim",
			"reload",
			"shotgun",
			"shield_slam",
			"charged_projectile",
			"beam",
			"geiser_targeting",
			"geiser",
			"instant_wield",
			"throw_grimoire",
			"healing_draught",
			"flamethrower",
			"career_dr_three",
			"career_bw_one",
			"career_we_three",
			"career_we_three_piercing",
			"career_wh_two",
		},
		sound_type = NetworkLookup.melee_impact_sound_types,
		stagger_angle = {
			"down",
			"smiter",
			"stab",
			"pull",
		},
		wield_anim = sorted_anims,
	}
	self._defered_init_done = true
end

ImguiWeaponEditor.checkpoint = function (self)
	self._tabs0 = {
		BoostCurves = clone(BoostCurves),
		DamageProfileTemplates = clone(DamageProfileTemplates),
		PowerLevelTemplates = clone(PowerLevelTemplates),
		AttackTemplates = clone(AttackTemplates),
		Weapons = clone(Weapons),
	}
end

ImguiWeaponEditor.is_persistent = function (self)
	return self._persistent
end

ImguiWeaponEditor.update = function (self)
	self:_defered_init()
end

ImguiWeaponEditor.edit_table = function (self, t)
	local metadata = self._table_metadata[t]

	for i = 1, #metadata.keys do
		local key = metadata.keys[i]
		local value = t[key]
		local td = type(value)

		if td == "table" then
			if Imgui.tree_node(key, false) then
				metadata.new_key = Imgui.input_text("Key", metadata.new_key)
				metadata.new_value = Imgui.input_text("Value", metadata.new_value)

				if Imgui.small_button("Add field") then
					local val

					val, metadata.error = self:exec("local t = ... return " .. metadata.new_value, value)

					if val ~= nil then
						rawset(value, metadata.new_key, val)

						metadata.keys[#metadata.keys + 1] = metadata.new_key
						metadata.new_key, metadata.new_value = "", ""
					end
				end

				if metadata.error then
					Imgui.text_colored(metadata.error, 255, 100, 100, 255)
				end

				Imgui.separator()
				self:edit_table(value)
				Imgui.tree_pop()
			end
		elseif td == "boolean" then
			t[key] = Imgui.checkbox(key, value)
		elseif td == "number" then
			t[key] = Imgui.input_float(key, value)
		elseif td == "string" then
			local lut, index = self._lut_lut[key]

			if lut then
				index = table.find(lut, value)
			end

			if index then
				t[key] = lut[Imgui.combo(key, index, lut)]
			else
				t[key] = Imgui.input_text(key, value)
			end
		end
	end
end

ImguiWeaponEditor._apply_to_existing_items = function (self)
	for backend_id, modified_item_template in pairs(Managers.backend:get_interface("items")._modified_templates) do
		printf("[ImguiWeaponEditor] Updating %s (%s)", backend_id, modified_item_template.name)
		table.merge(modified_item_template, WeaponUtils.get_weapon_template(modified_item_template.name))
	end
end

ImguiWeaponEditor.draw = function (self, _)
	local do_close = Imgui.begin_window("Weapon Editor", "menu_bar")

	self._persistent = Imgui.checkbox("Persistent window", self._persistent)

	if Imgui.begin_menu_bar() then
		if Imgui.menu_item("Load") then
			Managers.chat:add_local_system_message(1, "Stripped", true)
		end

		if Imgui.menu_item("Save") then
			Managers.chat:add_local_system_message(1, "Stripped", true)
		end

		if Imgui.menu_item("Refresh items") then
			self:_apply_to_existing_items()
		end

		Imgui.end_menu_bar()
	end

	Imgui.separator()
	Imgui.begin_child_window("Editor", 0, 0, true)
	self:edit_table(self._tabs)
	Imgui.end_child_window()
	Imgui.end_window()

	return do_close
end
