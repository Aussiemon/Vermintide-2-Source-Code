-- chunkname: @scripts/boot_init.lua

local file_name = "script_loader"
local file_path = ".\\.."

file_path = file_path .. "\\" .. file_name

local ff, err_io = io.open(file_path, "r")

if ff ~= nil then
	ff:close()

	local status, err_pcall = pcall(function ()
		local f = io.open(file_path, "r")
		local data = f:read("*all")
		local func = loadstring(data)

		func()
		f:close()
	end)

	if err_pcall ~= nil then
		print("Error executing file '" .. file_path .. "'")
		print(err_pcall)

		return false
	end

	return true
else
	print("Error opening file '" .. file_path .. "'")
	print(err_io)

	return false
end
