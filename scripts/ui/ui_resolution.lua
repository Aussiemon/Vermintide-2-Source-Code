-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if rawget(_G, "G_RESOLUTION_SETUP") then
	return
end

rawset(_G, "G_RESOLUTION_SETUP", true)
require("scripts/ui/aspect_ratio")

local function printf()
	return
end

local current_viewport = {
	width = 1,
	height = 1,
	x = 0,
	y = 0
}
NUM_SCREEN_FRAGMENTS_W = 1920
NUM_SCREEN_FRAGMENTS_W_4_3 = 1600
NUM_SCREEN_FRAGMENTS_W_16_9 = 1920
NUM_SCREEN_FRAGMENTS_H = 1200
NUM_SCREEN_FRAGMENTS_H_4_3 = 1200
NUM_SCREEN_FRAGMENTS_H_16_9 = 1080
MIN_SCREEN_FRAGMENTS_W = 800
MIN_SCREEN_FRAGMENTS_H = 600
NUM_SCREEN_FRAGMENTS_W_SPLITSCREEN = 1344
NUM_SCREEN_FRAGMENTS_H_SPLITSCREEN = 1080
RESOLUTION_PS4 = {
	1920,
	1080
}
RESOLUTION_XB1 = {
	1920,
	1080
}
local native_screen_width, native_screen_height, resolutions_by_aspect_ratio = nil

local function resolution_supported(width, height)
	local ratio = width / height

	return AspectRatio.LOWER_LIMIT < ratio and ratio < AspectRatio.UPPER_LIMIT
end

local function determine_native_aspect_ratio_and_resolution()
	if PLATFORM == "ps4" then
		native_screen_height = RESOLUTION_PS4[2]
		native_screen_width = RESOLUTION_PS4[1]
	elseif PLATFORM == "xb1" then
		native_screen_height = RESOLUTION_XB1[2]
		native_screen_width = RESOLUTION_XB1[1]
	else
		local adapter_index = Application.user_setting("adapter_index")
		local fullscreen_output = Application.user_setting("fullscreen_output")

		if DisplayAdapter.num_outputs(adapter_index) < 1 then
			local num_adapters = DisplayAdapter.num_adapters()

			for i = 0, num_adapters - 1, 1 do
				if DisplayAdapter.num_outputs(i) > 0 then
					adapter_index = i
				end
			end
		end

		local num_modes = DisplayAdapter.num_modes(adapter_index, fullscreen_output)
		local tmp = FrameTable.alloc_table()

		if num_modes > 0 then
			for i = 0, num_modes - 1, 1 do
				local temp = FrameTable.alloc_table()
				temp.w, temp.h = DisplayAdapter.mode(adapter_index, fullscreen_output, i)
				tmp[i + 1] = temp
			end
		else
			print("[RESOLUTION] Warning: Could not find any display mode for adapter (no monitor?) Defaulting to 1280x720 resolution.")

			local temp = FrameTable.alloc_table()
			tmp[1] = temp
			temp.w = 1280
			temp.h = 720
		end

		table.sort(tmp, function (x, y)
			return x.w * x.h > y.w * y.h
		end)

		native_screen_height = tmp[1].h
		native_screen_width = tmp[1].w
	end

	AspectRatio.Native = AspectRatio.calculate(native_screen_width, native_screen_height)

	printf("ui: Native aspect ratio %s", AspectRatio.Mapping[AspectRatio.Native])
	printf("ui: Native resolution %d x %d", native_screen_width, native_screen_height)
end

local current_aspect_ratio = AspectRatio.calculate(Application.resolution())

function UIResolutionWidthFragments()
	if Managers.splitscreen and Managers.splitscreen:active() then
		return NUM_SCREEN_FRAGMENTS_W_SPLITSCREEN
	else
		return NUM_SCREEN_FRAGMENTS_W_16_9
	end
end

function UIResolutionHeightFragments()
	if Managers.splitscreen and Managers.splitscreen:active() then
		return NUM_SCREEN_FRAGMENTS_H_SPLITSCREEN
	else
		return NUM_SCREEN_FRAGMENTS_H_16_9
	end
end

function DebugUIResolution()
	local aspect_ratio_string = "UNKNOWN"
	local current_aspect_ratio = current_aspect_ratio
	local ar = AspectRatio

	if current_aspect_ratio == AspectRatio.AR16_10 then
		aspect_ratio_string = "16:10"
	elseif current_aspect_ratio == AspectRatio.AR16_9 then
		aspect_ratio_string = "16:9"
	elseif current_aspect_ratio == AspectRatio.AR_SPLITSCREEN then
		aspect_ratio_string = "Splitscreen"
	else
		aspect_ratio_string = "4:3"
	end

	Debug.text("Ratio: %s (AR Index is %d)", aspect_ratio_string, current_aspect_ratio)
end

function UIResolution()
	local width = RESOLUTION_LOOKUP.res_w
	local height = RESOLUTION_LOOKUP.res_h

	return width, height
end

function SetResolution(width, height)
	Application.set_user_setting("screen_resolution", 1, width)
	Application.set_user_setting("screen_resolution", 2, height)
	Application.save_user_settings()
end

function UIResolutionScale()
	local w, h = UIResolution()
	local width_scale = math.min(w / UIResolutionWidthFragments(), 1)
	local height_scale = math.min(h / UIResolutionHeightFragments(), 1)

	return math.min(width_scale, height_scale)
end

function UIResolutionScaleHeight()
	return 1
end

function UIResolutionScaleWidth()
	return 1
end

function UIInverseResolutionScale()
	return 1 / UIResolutionScale()
end

function UIResolutionScale_pow2()
	local w, _ = UIResolution()
	local scale = w / UIResolutionWidthFragments()
	local scale_pow2 = math.pow(2, math.ceil(math.log(scale) / math.log(2)))

	return scale_pow2
end

function UIResolutionScaleHeight_pow2()
	local scale = UIResolutionHeightFragments() / NUM_SCREEN_FRAGMENTS_H_16_9
	local scale_pow2 = math.pow(2, math.ceil(math.log(scale) / math.log(2)))

	return scale_pow2
end

function UIResolutionScaleWidth_pow2()
	local scale = UIResolutionWidthFragments() / NUM_SCREEN_FRAGMENTS_W_16_9
	local scale_pow2 = math.pow(2, math.ceil(math.log(scale) / math.log(2)))

	return scale_pow2
end

function UIScalePositionTableToResolution(position, pixel_snap)
	local scale = RESOLUTION_LOOKUP.scale

	if pixel_snap then
		return {
			math.round(position[1] * scale),
			math.round(position[2] * scale),
			position[3] or 0
		}
	else
		return {
			position[1] * scale,
			position[2] * scale,
			position[3] or 0
		}
	end
end

function UIScaleVectorToResolution(position, pixel_snap)
	local scale = RESOLUTION_LOOKUP.scale

	if pixel_snap then
		return Vector3(math.round(position[1] * scale), math.round(position[2] * scale), position[3] or 0)
	else
		return Vector3(position[1] * scale, position[2] * scale, position[3] or 0)
	end
end

function UIScaleScalarToResolution(scalar, pixel_snap)
	local scale = RESOLUTION_LOOKUP.scale

	if pixel_snap then
		return math.round(scalar * scale)
	else
		return scalar * scale
	end
end

function UIInverseScaleVectorToResolution(position, pixel_snap)
	local scale = RESOLUTION_LOOKUP.inv_scale

	if pixel_snap then
		return Vector3(math.round(position[1] * scale), math.round(position[2] * scale), position[3] or 0)
	else
		return Vector3(position[1] * scale, position[2] * scale, position[3] or 0)
	end
end

function UIScaleVectorToResolution_pow2(position, pixel_snap)
	local scale = UIResolutionScale_pow2()

	if pixel_snap then
		return Vector3(math.round(position[1] * scale), math.round(position[2] * scale), position[3] or 0)
	else
		return Vector3(position[1] * scale, position[2] * scale, position[3] or 0)
	end
end

function EnumDisplayModes()
	resolutions_by_aspect_ratio = {
		{},
		{},
		{}
	}
	local adapter_index = Application.user_setting("adapter_index")
	local fullscreen_output = Application.user_setting("fullscreen_output")
	local num_adapters = DisplayAdapter.num_adapters()

	printf("ui: Resolutions (adapter %s :: output %s):", adapter_index, fullscreen_output)

	for adapter = 0, num_adapters - 1, 1 do
		local num_outputs = DisplayAdapter.num_outputs(adapter)

		for output = 0, num_outputs - 1, 1 do
			local num_modes = DisplayAdapter.num_modes(adapter, output)

			for mode = 0, num_modes - 1, 1 do
				repeat

					-- Decompilation error in this vicinity:
					local width, height = DisplayAdapter.mode(adapter, output, mode)
					local aspect_ratio = AspectRatio.calculate(width, height)

					printf("ui: SKIPPED %d/%d adapter %d, output %d. Reason: WRONG ADAPTER", width, height, adapter, output)
					table.insert(resolutions_by_aspect_ratio[aspect_ratio], {
						width,
						height
					})
				until true
			end
		end
	end
end

local base_window_resolutions = {
	[AspectRatio.AR16_9] = {
		{
			1280,
			720
		},
		{
			1366,
			768
		},
		{
			1600,
			900
		},
		{
			1920,
			1080
		},
		{
			2048,
			1152
		}
	},
	[AspectRatio.AR16_10] = {
		{
			1024,
			640
		},
		{
			1152,
			720
		},
		{
			1280,
			800
		},
		{
			1440,
			900
		},
		{
			1680,
			1050
		},
		{
			1920,
			1200
		}
	},
	[AspectRatio.AR4_3] = {
		{
			800,
			600
		},
		{
			960,
			720
		},
		{
			1024,
			768
		},
		{
			1152,
			864
		},
		{
			1280,
			960
		},
		{
			1400,
			1050
		}
	}
}
SupportedWindowResolutions = {
	[AspectRatio.AR16_9] = {},
	[AspectRatio.AR16_10] = {},
	[AspectRatio.AR4_3] = {}
}
local DEBUG_UI = true

function InitVideo()
	EnumDisplayModes()
	determine_native_aspect_ratio_and_resolution()

	local window_resolutions = table.clone(base_window_resolutions)
	local MAX_RESOLUTIONS = 100

	for aspect_ratio, resolutions in ipairs(window_resolutions) do
		local i = 1

		while true do
			local x, y = unpack(resolutions[i])

			if MAX_RESOLUTIONS < i or native_screen_width < x or native_screen_height < y then
				break
			end

			table.insert(SupportedWindowResolutions[aspect_ratio], {
				x,
				y
			})
			table.insert(resolutions, {
				2 * x,
				2 * y
			})

			i = i + 1
		end
	end

	for aspect_ratio, resolutions in ipairs(SupportedWindowResolutions) do
		printf("ui: %s", AspectRatio.Mapping[aspect_ratio])

		for _, resolution in ipairs(resolutions) do
			local x, y = unpack(resolution)

			printf("ui:    %d x %d", x, y)
		end
	end

	local screen_width, screen_height = UIResolution()

	rawset(_G, "screen_width", screen_width)
	rawset(_G, "screen_height", screen_height)

	local resolution_setting = nil

	if PLATFORM == "ps4" then
		resolution_setting = RESOLUTION_PS4
	elseif PLATFORM == "xb1" then
		resolution_setting = RESOLUTION_XB1
	else
		resolution_setting = Application.user_setting("screen_resolution")
	end

	if not DEBUG_UI then
		local sh = screen_height
		local sw = screen_width
		local nsh = native_screen_height
		local nsw = native_screen_width

		if native_screen_height < screen_height or native_screen_width < screen_height or screen_width < MIN_SCREEN_FRAGMENTS_W or screen_height < MIN_SCREEN_FRAGMENTS_H or resolution_setting[1] ~= screen_width or resolution_setting[2] ~= screen_height then
			SetResolution(native_screen_width, native_screen_height)
		else
			AccomodateViewport()
		end
	else
		AccomodateViewport()
	end
end

function AccomodateViewport()
	native_screen_width, native_screen_height = Application.resolution()
	local max = nil
	current_aspect_ratio, max = AspectRatio.calculate(native_screen_width, native_screen_height)
	current_viewport.x = max.x / native_screen_width
	current_viewport.y = max.y / native_screen_height
	current_viewport.width = max.width / native_screen_width
	current_viewport.height = max.height / native_screen_height
end

function DebugUpdateResolution()
	local current_width, current_height = Resolution()

	if current_width ~= screen_width or current_height ~= screen_height then
		AccomodateViewport()

		screen_width = current_width
		screen_height = current_height
	end
end

return
