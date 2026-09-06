---@param t table<string,string[]> {filetype, patterns[]}
---@return table<string,string>
local function populate_table(t)
	local tmp = {}
	for filetype, files in pairs(t) do
		for _, file in pairs(files) do
			tmp[file] = filetype
		end
	end
	return tmp
end

--defines systemd and podman quadlet filetypes
local ext_patterns = {
	systemd = {
		"service",
		"socket",
		"timer",
		"mount",
		"automount",
		"swap",
		"target",
		"path",
		"slice",
		"scope",
		"device",
	},
	podman = {
		"container",
		"volume",
		"network",
		"kube",
		"pod",
		"build",
		"image",
	},
}

-- add relevant filetypes for systemd
vim.filetype.add({
	extension = populate_table(ext_patterns),
	filename = {},
	pattern = {},
})
