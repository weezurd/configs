-- LazyVim now uses blink.cmp for completion (not nvim-cmp), so Tab behaviour has
-- to be configured there. This keeps the same behaviour as the old nvim-cmp
-- setup: Tab selects the next item, jumps through snippets, or opens the menu
-- after a word; Shift-Tab goes back.
return {
	"saghen/blink.cmp",
	opts = function(_, opts)
		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		-- Setting <Tab> here means LazyVim's own <Tab> default (which adds AI
		-- accept/NES actions) is skipped. That only matters if you enable an AI
		-- completion extra later.
		opts.keymap = opts.keymap or {}
		opts.keymap["<Tab>"] = {
			-- You could replace "select_next" with "select_and_accept" to get VS Code autocompletion behavior
			"select_next",
			"snippet_forward",
			function(cmp)
				if has_words_before() then
					return cmp.show()
				end
			end,
			"fallback",
		}
		opts.keymap["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" }
	end,
}
