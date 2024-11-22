-- chunkname: @scripts/ui/helpers/handbook_logic.lua

HandbookLogic = class(HandbookLogic)

HandbookLogic.init = function (self, context, blueprints)
	local context_copy = table.merge({
		layout = self,
	}, context)

	self._context = context_copy
	self._reference_name = context.reference_name or "HandbookLogic"
	self._blueprints = blueprints
	self._video_references = {}
	self._loaded_packages = {}
	self._reusable_material = false
end

HandbookLogic.destroy = function (self)
	self:_destroy_video_players()
	self:_unload_packages()
end

HandbookLogic.create_video_player = function (self, resource)
	local reference_name = self._reference_name .. "@" .. resource
	local video_references = self._video_references
	local context = self._context

	if not video_references[reference_name] then
		UIRenderer.create_video_player(context.ui_renderer, reference_name, context.world, resource, true)

		video_references[reference_name] = reference_name
	end

	return reference_name
end

HandbookLogic._destroy_video_players = function (self)
	if table.is_empty(self._video_references) then
		return
	end

	local world = self._context.world
	local ui_renderer = self._context.ui_renderer

	for reference_name in pairs(self._video_references) do
		UIRenderer.destroy_video_player(ui_renderer, reference_name, world)
	end

	table.clear(self._video_references)
end

HandbookLogic.load_texture_package = function (self, texture_path, widget)
	local material = self._reusable_material

	if not material then
		local gui = self._context.ui_renderer.gui

		Gui.clone_material_from_template(gui, "material_handbook_diffuse", "template_store_diffuse_masked")

		material = Gui.material(gui, "material_handbook_diffuse")
		self._reusable_material = material
	end

	local function package_load_cb()
		Material.set_texture(material, "diffuse_map", texture_path)

		widget.content.texture = material
	end

	local async = true

	Managers.package:load(texture_path, self._reference_name, package_load_cb, async)

	self._loaded_packages[texture_path] = texture_path

	return "material_handbook_diffuse"
end

HandbookLogic._unload_packages = function (self)
	if self._reusable_material then
		Material.set_texture(self._reusable_material, "diffuse_map", UISettings.transparent_placeholder_texture)

		self._reusable_material = nil
	end

	local reference_name = self._reference_name

	for package_name in pairs(self._loaded_packages) do
		Managers.package:unload(package_name, reference_name)
	end

	table.clear(self._loaded_packages)
end

HandbookLogic._create_entry = function (self, entry)
	if entry.condition == false then
		return
	end

	if entry.condition_func and not entry:condition_func() then
		return
	end

	local entry_type = entry.type
	local blueprint = self._blueprints[entry_type]

	if not blueprint then
		return
	end

	local widget_def = blueprint(self._context, entry)
	local widget = UIWidget.init(widget_def)

	if entry_type == "image" then
		local texture_path = "gui/1080p/single_textures/handbook/" .. entry.texture

		self:load_texture_package(texture_path, widget)
	end

	return widget
end

HandbookLogic.create_entry_widgets = function (self, page_settings)
	local entry_widgets = {}

	self:_destroy_video_players()
	self:_unload_packages()

	entry_widgets[1] = self:_create_entry({
		padding = 0,
		type = "text",
		text = page_settings.display_name,
		style = {
			font_size = 64,
			font_type = "hell_shark_header_masked",
			upper_case = true,
			text_color = Colors.get_color_table_with_alpha("font_title", 255),
		},
	})

	local total_height = entry_widgets[1].content.size[2]

	entry_widgets[1].offset[2] = -total_height

	for i = 1, #page_settings do
		local widget = self:_create_entry(page_settings[i])

		if widget then
			entry_widgets[#entry_widgets + 1] = widget

			local content = widget.content
			local widget_height = content.size[2]
			local padding = content.padding or 0

			total_height = total_height + widget_height + padding
			widget.offset[2] = -total_height
		end
	end

	return entry_widgets, total_height
end
