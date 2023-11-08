local BASE_VALUE = 8388608
local SHADER_FLAGS = {
	"NECROMANCER_CAREER_REMAP"
}
local PARTICLE_LIGHTING_REMAP_VALUES = {
	NECROMANCER_CAREER_REMAP = {
		39,
		0,
		182,
		110
	}
}

local function find(t, element)
	for key, value in pairs(t) do
		if value == element then
			return key
		end
	end

	return nil
end

local function set_render_setting(variable_name, value, optional_shader_flag_name)
	if GlobalShaderFlags.overridden_shader_flags[optional_shader_flag_name] == nil then
		Application.set_render_setting(variable_name, value)
	end

	GlobalShaderFlags.stored_values[variable_name] = value
end

local function setup_particle_lighting_remapping()
	local array = {}

	for name, color in pairs(PARTICLE_LIGHTING_REMAP_VALUES) do
		local index = find(SHADER_FLAGS, name)
		array[(index - 1) * 4 + 1] = color[2] / 255
		array[(index - 1) * 4 + 2] = color[3] / 255
		array[(index - 1) * 4 + 3] = color[4] / 255
		array[(index - 1) * 4 + 4] = color[1] / 255
	end

	set_render_setting("particle_light_remapping_table", array)
end

local function setup_global_shader_flags()
	set_render_setting("global_shader_flags", BASE_VALUE)
end

GlobalShaderFlags = GlobalShaderFlags or {}
GlobalShaderFlags.stored_values = GlobalShaderFlags.stored_values or {}
GlobalShaderFlags.overridden_shader_flags = GlobalShaderFlags.overridden_shader_flags or {}

GlobalShaderFlags.reset = function ()
	assert(#SHADER_FLAGS < 23, string.format("[GlobalShaderFlags] There is a maximum of 22 available shader flags. %q is out of scope", SHADER_FLAGS[#SHADER_FLAGS]))
	setup_particle_lighting_remapping()
	setup_global_shader_flags()
end

local function update_global_shader_flags(variable_name, enable)
	local lshift_value = find(SHADER_FLAGS, variable_name)

	assert(lshift_value, string.format("[GlobalShaderFlags] There is no flag called %q setup in global_shader_flags.lua", variable_name))

	local global_shader_flags = Application.render_config("settings", "global_shader_flags")
	local new_global_shader_flags = nil

	if enable then
		new_global_shader_flags = bit.bor(global_shader_flags, bit.lshift(1, lshift_value - 1))
	else
		new_global_shader_flags = bit.band(global_shader_flags, bit.bnot(bit.lshift(1, lshift_value - 1)))
	end

	return new_global_shader_flags
end

GlobalShaderFlags.set_global_shader_flag = function (shader_flag_name, enable)
	local global_shader_flags = update_global_shader_flags(shader_flag_name, enable)

	set_render_setting("global_shader_flags", global_shader_flags, shader_flag_name)
end

GlobalShaderFlags.set_override_shader_flag = function (shader_flag_name, enable)
	local global_shader_flags = update_global_shader_flags(shader_flag_name, enable)

	Application.set_render_setting("global_shader_flags", global_shader_flags)

	GlobalShaderFlags.overridden_shader_flags[shader_flag_name] = enable
end

GlobalShaderFlags.remove_override_shader_flag = function (shader_flag_name)
	local global_shader_flags = GlobalShaderFlags.stored_values.global_shader_flags
	local lshift_value = find(SHADER_FLAGS, shader_flag_name)
	local mask = bit.lshift(1, lshift_value - 1)
	local enable = bit.band(global_shader_flags, mask) > 0
	local global_shader_flags = update_global_shader_flags(shader_flag_name, enable)

	Application.set_render_setting("global_shader_flags", global_shader_flags)

	GlobalShaderFlags.overridden_shader_flags[shader_flag_name] = nil
end

GlobalShaderFlags.apply_settings = function ()
	for variable_name, value in pairs(GlobalShaderFlags.stored_values) do
		set_render_setting(variable_name, value)
	end
end

GlobalShaderFlags.print_debug = function ()
	if BUILD ~= "release" then
		local global_shader_flags = Application.render_config("settings", "global_shader_flags")

		print("")
		print("##########################")
		print("[GlobalShaderFlags]")

		local flags = ""

		for i = 31, 0, -1 do
			local mask = bit.lshift(1, i)
			local value = bit.band(global_shader_flags, mask)
			local spacing = i % 8 == 0 and " " or ""
			flags = flags .. (value >= 1 and 1 or 0) .. spacing
		end

		print("Bit Layout: " .. flags)
		print("---------------------------")
		print("")
		print("Active Shader Flags:")

		for i = 1, #SHADER_FLAGS do
			local name = SHADER_FLAGS[i]
			local mask = bit.lshift(1, i - 1)

			if bit.band(global_shader_flags, mask) > 0 then
				print("- " .. name)
			end
		end

		print("---------------------------")
		print("")
		print("<AVAILABLE SHADER FLAGS>")

		for i = 1, #SHADER_FLAGS do
			print("\t" .. SHADER_FLAGS[i])
		end

		print("</AVAILABLE SHADER FLAGS>")
		print("##########################")
		print("")

		local particle_light_remapping_table = Application.render_config("settings", "particle_light_remapping_table")

		print("Particle light remapping table = [")

		for i = 1, #particle_light_remapping_table, 4 do
			local shader_flag_index = (i + 3) / 4
			local a = "\tA: " .. particle_light_remapping_table[i + 3] * 255
			local r = "\tR: " .. particle_light_remapping_table[i] * 255
			local g = "\tG: " .. particle_light_remapping_table[i + 1] * 255
			local b = "\tB: " .. particle_light_remapping_table[i + 2] * 255 .. " // " .. SHADER_FLAGS[shader_flag_index]

			if i > 1 then
				print("\t----------------------")
			end

			print(a)
			print(r)
			print(g)
			print(b)
		end

		print("]")
		print("##########################")
		print("")
	end
end
