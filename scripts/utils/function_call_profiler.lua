local script_data = script_data

if _G.FunctionCallProfiler == nil then
	FunctionCallProfiler = {
		current_frame = 1,
		num_frames = 10,
		frames = {}
	}

	for i = 1, FunctionCallProfiler.num_frames, 1 do
		FunctionCallProfiler.frames[i] = {}
	end
end

FunctionCallProfiler.setup = function (world)
	FunctionCallProfiler.world = world
	FunctionCallProfiler.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")
end

FunctionCallProfiler.destroy = function ()
	World.destroy_gui(FunctionCallProfiler.gui)

	FunctionCallProfiler.world = nil
end

local font_size = 16
local font = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font

FunctionCallProfiler.render = function ()
	if not script_data.profile_function_calls then
		return
	end

	local num_frames = FunctionCallProfiler.num_frames
	local key_color = Color(250, 255, 120, 0)
	local res_x, res_y = Application.resolution()
	local gui = FunctionCallProfiler.gui
	local render_frame_index = FunctionCallProfiler.current_frame - 1
	local frames = FunctionCallProfiler.frames
	local start_x = res_x / 2
	local start_y = res_y / 2
	local pos = Vector3(start_x, start_y - font_size, 200)

	for i = 1, num_frames, 1 do
		render_frame_index = render_frame_index % num_frames + 1
		local frame = frames[render_frame_index]

		for frame_name, count in pairs(frame) do
			Gui.text(gui, frame_name .. "    " .. tostring(count), font_mtrl, font_size, font, pos, key_color)

			pos.y = pos.y - font_size * 1.5
		end

		pos.y = pos.y - font_size * 1.5
	end

	Gui.rect(gui, Vector3(start_x, pos.y + font_size, 100), Vector2(250, start_y - pos.y), Color(240, 25, 50, 25))
end

FunctionCallProfiler.log_function_call = function (name)
	if not script_data.profile_function_calls then
		return
	end

	local current_frame = FunctionCallProfiler.current_frame
	local frame = FunctionCallProfiler.frames[current_frame]

	if frame[name] == nil then
		frame[name] = 0
	end

	frame[name] = frame[name] + 1
end

function LogFunctionCall(name)
	FunctionCallProfiler.log_function_call(name)
end

return
