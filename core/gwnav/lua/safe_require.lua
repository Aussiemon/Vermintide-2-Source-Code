local error_level = 0
local safely_required_modules = {}
local latest_safely_required_file = nil

function safe_require(file)
	if safely_required_modules[file] == nil then
		latest_safely_required_file = file
		required_module = require(file)

		if latest_safely_required_file ~= nil then
			print_warning("`safe_require` called on unguarded file '" .. file .. "', falling back to `require` i.e. looping `require` calls will raise errors")

			latest_safely_required_file = nil

			return required_module
		end

		safely_required_modules[file] = required_module
	elseif error_level == 1 then
		require(file)
	end

	return safely_required_modules[file]
end

function safe_require_guard()
	local new_module = {}

	if latest_safely_required_file == nil then
		print_warning("`safe_require` should be used for modules using `safe_require_guard`, otherwise looping `require` calls will raise errors")

		return new_module
	end

	safely_required_modules[latest_safely_required_file] = new_module
	latest_safely_required_file = nil

	return new_module
end

function set_safe_require_error_level(new_error_level)
	error_level = new_error_level

	return 
end

return 
