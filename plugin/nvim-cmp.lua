vim.o.incsearch = true
vim.o.completeopt = "menu,menuone,preview,noinsert,noselect"

-- lspkind
local lspkind = require("lspkind")
lspkind.init({
	with_text = true,
	symbol_map = {
		TypeParameter = "",
	},
})

local cmp = require("cmp")
cmp.setup({
	experimental = {
		ghost_text = true,
	},
	documentation = {
		border = { '', '' ,'', ' ', '', '', '', ' ' },
		-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = {
		["<C-e>"] = cmp.mapping.close(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "spell" },
		{ name = "buffer" },
		-- { name = "rg", option = { additional_arguments = "--smart-case" } },
	}),
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s %s", lspkind.presets.default[vim_item.kind], vim_item.kind)
			-- Menu icons
			vim_item.menu = ({
				nvim_lsp = " ",
				nvim_lua = " ",
				vsnip = " ×͜×",
				path = " ﱮ",
				spell = " 暈",
				buffer = " ﬘",
				rg = " ☂",
			})[entry.source.name]

			return vim_item
		end,
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{
			name = "buffer",
		},
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
