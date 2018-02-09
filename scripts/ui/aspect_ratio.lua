AspectRatio = {
	AR16_9 = 1,
	AR16_10 = 2,
	AR4_3 = 3,
	AR_SPLITSCREEN = 4,
	ERROR_MARGIN = 0.001,
	Native = nil
}
AspectRatio.Values = {
	[AspectRatio.AR16_9] = 1.7777777777777777,
	[AspectRatio.AR16_10] = 1.6,
	[AspectRatio.AR4_3] = 1.3333333333333333,
	[AspectRatio.AR_SPLITSCREEN] = 1.2444444444444445
}
AspectRatio.Mapping = table.mirror_table({
	[AspectRatio.AR16_9] = "16:9",
	[AspectRatio.AR16_10] = "16:10",
	[AspectRatio.AR4_3] = "4:3",
	[AspectRatio.AR_SPLITSCREEN] = "Splitscreen"
})
AspectRatio.UPPER_LIMIT = AspectRatio.Values[AspectRatio.AR16_9]*1.05
AspectRatio.LOWER_LIMIT = AspectRatio.Values[AspectRatio.AR_SPLITSCREEN]*0.95

local function fit_aspect(ratio, screen_width, screen_height)
	local window_ratio = screen_width/screen_height
	local tmp_table = FrameTable.alloc_table()
	tmp_table.width = screen_width
	tmp_table.height = screen_height
	tmp_table.x = 0
	tmp_table.y = 0

	if window_ratio < ratio then
		tmp_table.height = tmp_table.width/ratio
		tmp_table.y = (screen_height - tmp_table.height)/2
	else
		tmp_table.width = tmp_table.height*ratio
		tmp_table.x = (screen_width - tmp_table.width)/2
	end

	return tmp_table
end

local function box_max(box1, box2)
	local b1 = box1.width*box1.height
	local b2 = box2.width*box2.height

	return (b2 < b1 and box1) or box2
end

AspectRatio.calculate = function (width, height)
	local four_three = fit_aspect(1.3333333333333333, width, height)
	local sixteen_ten = fit_aspect(1.6, width, height)
	local sixteen_nine = fit_aspect(1.7777777777777777, width, height)
	local splitscreen = fit_aspect(1.2444444444444445, width, height)
	local max = box_max(splitscreen, box_max(four_three, box_max(sixteen_ten, sixteen_nine)))

	if max == splitscreen then
		return AspectRatio.AR_SPLITSCREEN, max
	elseif max == four_three then
		return AspectRatio.AR4_3, max
	elseif max == sixteen_ten then
		return AspectRatio.AR16_10, max
	else
		return AspectRatio.AR16_9, max
	end

	return 
end

return 
