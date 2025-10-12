-- vim.lsp.enable({
-- 	"lua-ls",
-- 	"emmet-ls",
-- 	"tailwindcss",
-- 	"ts-ls",
-- 	"yamlls",
-- 	"kotlin-lsp",
-- 	"marksman",
-- })

function list_lsp_names()
	local dir = "~/.config/nvim/lsp"
	local out = {}

	for name, type_ in vim.fs.dir(dir) do
		if type_ == "file" then
			local basename = name:match("^(.*)%.") or name
			table.insert(out, basename)
		end
	end
	return out
end

vim.lsp.enable(list_lsp_names())
