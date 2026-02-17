-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
vim.cmd("set number")
vim.cmd("set ruler")
vim.cmd("set relativenumber")
vim.cmd("set shiftwidth=4")
vim.g.lazyvim_check_order = false

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
	-- Configure LazyVim to load gruvbox
	{
	    "LazyVim/LazyVim",
	    opts = {
		colorscheme = "gruvbox",
	    },
	},
	-- use mini.starter instead of alpha
	{ import = "lazyvim.plugins.extras.ui.mini-starter" },
	-- add your plugins here
	{
	    "lervag/vimtex",
	    lazy = false,     -- we don't want to lazy load VimTeX
	    -- tag = "v2.15", -- uncomment to pin to a specific release
	    init = function()
	    -- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "zathura"
	    end
	},
	{
	    'saghen/blink.cmp',
	    -- optional: provides snippets for the snippet source
	    dependencies = { 'rafamadriz/friendly-snippets' },

	    -- use a release tag to download pre-built binaries
	    version = '1.*',
		-- and/or build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- if you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.config
		opts = {
		    -- 'default' (recommended) for mappings similar to built-in completions (c-y to accept)
		    -- 'super-tab' for mappings similar to vscode (tab to accept)
		    -- 'enter' for enter to accept
		    -- 'none' for no mappings
		    --
		    -- all presets have the following mappings:
		    -- c-space: open menu or open docs if already open
		    -- c-n/c-p or up/down: select next/previous item
		    -- c-e: hide menu
		    -- c-k: toggle signature help (if signature.enabled = true)
		    --
		    -- see :h blink-cmp-config-keymap for defining your own keymap
		    keymap = { preset = 'super-tab' },

		    appearance = {
			-- 'mono' (default) for 'nerd font mono' or 'normal' for 'nerd font'
			-- adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'normal'
		    },

		    -- (Default) Only show the documentation popup when manually triggered
		    completion = { documentation = { auto_show = false } },

		    -- Default list of enabled providers defined so that you can extend it
		    -- elsewhere in your config, without redefining it, due to `opts_extend`
		    sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		    },

		    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		    --
		    -- See the fuzzy documentation for more information
		    fuzzy = { implementation = "prefer_rust_with_warning" }
		},
	    opts_extend = { "sources.default" }
	},
	{
	    "mason-org/mason.nvim",
	    opts = {}
	},
	{
	    "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	    },
		lazy = false, -- neo-tree will lazily load itself
	},
	{
	    "lukas-reineke/indent-blankline.nvim",
	    main = "ibl",
	    ---@module "ibl"
	    ---@type ibl.config
	    opts = {},
	},
	{ "ellisonleao/gruvbox.nvim" },


	-- change trouble config
	{
	    "folke/trouble.nvim",
	    -- opts will be merged with the parent spec
	    opts = { use_diagnostic_signs = true },
	},


	-- change some telescope options and a keymap to browse plugin files
	{
	    "nvim-telescope/telescope.nvim",
	    keys = {
		-- add a keymap to browse plugin files
		-- stylua: ignore
		{
		    "<leader>ff",
		    function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
		    desc = "Find Plugin File",
		},
	    },
	    -- change some options
	    opts = {
		defaults = {
		    layout_strategy = "horizontal",
		    layout_config = { prompt_position = "top" },
		    sorting_strategy = "ascending",
		    winblend = 0,
		},
	    },
	},


	{
	    "nvim-treesitter/nvim-treesitter",
	    lazy = false,
	    build = ':TSUpdate',
	},


	{
	    "nvim-lualine/lualine.nvim",
	    event = "VeryLazy",
	},
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
