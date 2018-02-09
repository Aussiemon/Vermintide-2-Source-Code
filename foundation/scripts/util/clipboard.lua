if PLATFORM ~= "win32" or not rawget(_G, "jit") then
	Clipboard = {
		get = function ()
			return ""
		end,
		put = function ()
			return 
		end
	}

	return 
end

local ffi = lua_require("ffi")
local user32 = ffi.load("USER32")
local kernel32 = ffi.load("KERNEL32")

ffi.cdef([[
enum { CF_TEXT = 1 };
enum { GMEM_MOVEABLE = 2 };
int      OpenClipboard(void*);
void*    GetClipboardData(unsigned);
int      CloseClipboard();
int      SetClipboardData(int, void*);
int      EmptyClipboard();

void*    memcpy(void*, void*, int);
void*    GlobalAlloc(int, int);
void*    GlobalLock(void*);
int      GlobalUnlock(void*);
size_t   GlobalSize(void*);
]])

Clipboard = {
	get = function ()
		local ok1 = user32.OpenClipboard(nil)
		local handle = user32.GetClipboardData(user32.CF_TEXT)
		local size = kernel32.GlobalSize(handle)
		local mem = kernel32.GlobalLock(handle)
		local text = ffi.string(mem, size)
		local ok2 = kernel32.GlobalUnlock(handle)
		local ok3 = user32.CloseClipboard()

		return text
	end,
	put = function (text)
		local text_len = #text + 1
		local hMem = kernel32.GlobalAlloc(user32.GMEM_MOVEABLE, text_len)

		ffi.copy(kernel32.GlobalLock(hMem), text, text_len)
		kernel32.GlobalUnlock(hMem)
		user32.OpenClipboard(nil)
		user32.EmptyClipboard()
		user32.SetClipboardData(user32.CF_TEXT, hMem)
		user32.CloseClipboard()

		return 
	end
}

return 
