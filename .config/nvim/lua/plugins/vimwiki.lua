return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/personal/wiki/",
				syntax = "markdown",
				ext = "md",
				-- diary_frequency = "weekly", -- 'monthly' 'yearly'
				diary_start_week_day = "monday",
				-- use journal/ instead of diary/
				diary_rel_path = "journal",
			},
		}
		-- treat only files under personal/wiki as vimwiki files
		vim.g.vimwiki_global_ext = 0
		-- notes get automatic title eg: # 2025-10-08, format YYYY-MM-DD
		-- vim.g.vimwiki_auto_header = 1

		-- NOTE: setup indicating how to use scripting with templates

		vim.api.nvim_create_autocmd("BufNewFile", {
			pattern = "*journal/*.md",
			-- 0r! runs a command end inserts its output at line 0
			command = "0r! ~/.local/scripts/vimwiki-weekly-tpl.py '%'",
		})

		-- keybinds for toggling list items
		vim.keymap.set({ "n", "v" }, "<Leader>tl", "<Plug>VimwikiToggleListItem", { silent = true })
	end,
}
