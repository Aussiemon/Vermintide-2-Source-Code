local templates = require("scripts/settings/pool_table_templates")
local script_data = script_data

if _G.PoolTableVisualizer == nil then
	PoolTableVisualizer = {}
end

PoolTableVisualizer.templates = templates
PoolTableVisualizer.setup = function (world)
	PoolTableVisualizer.world = world
	PoolTableVisualizer.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")

	return 
end
PoolTableVisualizer.destroy = function ()
	World.destroy_gui(PoolTableVisualizer.gui)

	PoolTableVisualizer.world = nil

	return 
end
local font_size = 14
local font = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font
PoolTableVisualizer.render = function (t)
	if not script_data.profile_pool_tables then
		return 
	end

	Profiler.start("PoolTableVisualizer")

	local table_height = 2
	local key_color = Color(250, 255, 120, 0)
	local error_color = Color(250, 0, 0, 0)
	local ten_color = Color(250, 0, 0, 0)
	local res_x, res_y = Application.resolution()
	local gui = PoolTableVisualizer.gui
	local start_x = 100
	local start_y = res_y - 50
	local pos = Vector3(start_x, start_y, 200)
	local column_height = start_y - font_size * 2 - 50

	for template_name, template in pairs(PoolTableVisualizer.templates) do
		local pool_table_data = POOL_tables[template_name]
		local tables_per_column = math.min(template.pool_size, column_height / table_height)
		local text_min, text_max = Gui.text_extents(gui, string.format("%s %dx%d", template_name, template.pool_size, template.hash_count), font_mtrl, font_size)
		local header_width = text_max.x - text_min.x
		local column_width = 100
		local total_width = math.max(header_width, column_width * math.ceil(template.pool_size / tables_per_column))
		local height = tables_per_column * table_height + 20 + font_size * 2

		Gui.rect(gui, Vector3(pos.x - 1, pos.y - height + 20, 90), Vector2(total_width + 2, height), Color(255, 0, 0, 0))
		Gui.text(gui, template_name, font_mtrl, font_size, font, pos + Vector3(10, 0, 0), key_color)

		pos.y = pos.y - font_size
		local free_count = pool_table_data.free_count()
		local used_count = template.pool_size - free_count
		local total_kb = math.floor((template.pool_size * template.hash_count * 40) / 1024)
		local used_kb = math.floor((used_count * template.hash_count * 40) / 1024)

		Gui.text(gui, string.format("#%d/%d => %d/%d kb", used_count, template.pool_size, used_kb, total_kb), font_mtrl, font_size, font, pos + Vector3(10, 0, 0), key_color)

		pos.y = pos.y - font_size

		for table_i = 1, template.pool_size, 1 do
			if pool_table_data.availability[table_i] then
				local color = Color(255, 0, 220 + ((table_i % 2 == 0 and 30) or 0), 0)

				Gui.rect(gui, Vector3(pos.x, pos.y, 100), Vector2(column_width, table_height), color)
			else
				local pool_table = pool_table_data.tables[table_i]
				local table_size = table.size(pool_table) - 2
				local table_size_percent = table_size / template.hash_count
				local table_allocated_width = column_width * table_size_percent

				if table_size_percent <= 1 then
					Gui.rect(gui, Vector3(pos.x, pos.y, 100), Vector2(table_allocated_width, table_height), Color(255, 255, 50, 25))
					Gui.rect(gui, Vector3(pos.x + table_allocated_width, pos.y, 100), Vector2(column_width - table_allocated_width, table_height), Color(255, 250, 200, 25))
				else
					local color = Color(255, 255, (math.sin(t * 15) + 1) * 100, 150)

					Gui.rect(gui, Vector3(pos.x, pos.y, 100), Vector2(table_allocated_width, table_height), color)
					Gui.text(gui, tostring(table_size), font_mtrl, font_size, font, pos + Vector3((10 * table_i) % column_width, 0, 0), error_color)
				end
			end

			pos.y = pos.y - table_height

			if table_i % 50 == 0 then
				Gui.rect(gui, Vector3(pos.x, pos.y, 110), Vector2(7, 3), ten_color)
			elseif table_i % 10 == 0 then
				Gui.rect(gui, Vector3(pos.x, pos.y, 110), Vector2(3, 2), ten_color)
			end

			if pos.y < 50 then
				pos.y = start_y - font_size * 2
				pos.x = pos.x + column_width + 1
			end
		end

		pos.x = pos.x + total_width + 10
		pos.y = start_y
	end

	Profiler.stop("PoolTableVisualizer")

	return 
end

return 
