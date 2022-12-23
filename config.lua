--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "lunar"

vim.opt.relativenumber = true
vim.opt.wrap = false

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["d"] = "\"_d"
lvim.keys.visual_mode["d"] = "\"_d"
lvim.keys.normal_mode["c"] = "\"_c"
lvim.keys.visual_mode["c"] = "\"_c"
lvim.keys.visual_mode["p"] = "\"_c<C-r><C-o>+<Esc>"

lvim.keys.term_mode["<leader><Esc>"] = termcodes "<C-\\><C-N>"
lvim.keys.normal_mode["<leader><Esc>"] = "<cmd>BufferKill<CR>"
lvim.keys.visual_mode["<leader><Esc>"] = "<cmd>BufferKill<CR>"

lvim.keys.normal_mode["<leader><Esc>"] = "<cmd>BufferKill<CR>"
lvim.keys.normal_mode["<leader>t"] = ":let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>Acd $VIM_DIR<CR>"
lvim.keys.normal_mode["<leader>n"] = ":tabnew<CR>"
lvim.keys.normal_mode["<leader>a"] = ":SymbolsOutline<CR>"
lvim.keys.normal_mode["<leader>rr"] = ":NvimTreeRefresh<CR>"
lvim.keys.normal_mode["<leader>ra"] = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>"
lvim.keys.visual_mode["<leader>rs"] = ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>"
lvim.keys.visual_mode["<leader>rk"] = ":s/\\(.*\\)/\\1"

lvim.keys.normal_mode["∆"] = ":resize -2<CR>"
lvim.keys.normal_mode["˚"] = ":resize +2<CR>"
lvim.keys.normal_mode["˙"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["¬"] = ":vertical resize +2<CR>"


lvim.keys.visual_block_mode["∆"] = ":m '>+1<CR>gv-gv"
lvim.keys.visual_block_mode["˚"] = ":m '<-2<CR>gv-gv"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = 'horizontal'
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.lualine.sections.lualine_a = { 'mode' }
lvim.builtin.lualine.sections.lualine_c = {
  {
    'filename',
    path = 2, -- 0: Just the filename
  }
}


-- lvim.builtin.nvimtree.view = {
--   width = 50,
--   height = 30,
--   hide_root_folder = false,
--   side = "left",
--   preserve_window_proportions = false,
--   mappings = {
--     custom_only = false,
--     list = {},
--   },
--   number = false,
--   relativenumber = true,
--   signcolumn = "yes",
-- }

lvim.builtin.terminal.open_mapping = [[<c-\>]]

-- generic LSP settings

lvim.lsp.update_in_insert = true

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  --     {"folke/tokyonight.nvim"},
  --     {
  --       "folke/trouble.nvim",
  --       cmd = "TroubleToggle",
  --     },
  { "ray-x/lsp_signature.nvim" },
  { "simrat39/symbols-outline.nvim" },
  { "fatih/vim-go" },
  { "SirVer/ultisnips" },
  { "quangnguyen30192/cmp-nvim-ultisnips" },
  -- {
  --   "ggandor/lightspeed.nvim"
  -- },
  { "phaazon/hop.nvim" },
  {
    "tpope/vim-surround",
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  { "kdheepak/lazygit.nvim" },
  {
    "rust-lang/rust.vim"
  }
}

require("hop").setup()
vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })

-- local _, lightspeed = pcall(require, "lightspeed")
-- lightspeed.setup({
--   ignore_case = true
-- })

local _, cmp = pcall(require, "cmp")

local _, symbols_outline = pcall(require, "symbols-outline")
symbols_outline.setup()


local _, luasnip = pcall(require, "luasnip")
lvim.builtin.cmp.snippet = {
  expand = function(args)
    vim.fn["UltiSnips#Anon"](args.body)
    -- luasnip.lsp_expand(args.body)
  end,
}

lvim.builtin.cmp.sources = {
  { name = "ultisnips" },
  { name = "nvim_lsp" },
  { name = "path" },
  { name = "luasnip" },
  { name = "cmp_tabnine" },
  { name = "nvim_lua" },
  { name = "buffer" },
  { name = "calc" },
  { name = "emoji" },
  { name = "treesitter" },
  { name = "crates" },
  { name = "tmux" },
}
local _, cmp_ultisnips_mappings = pcall(require, "cmp_nvim_ultisnips.mappings")
local jumpable = lvim.builtin.cmp.jumpable
local check_backspace = lvim.builtin.cmp.check_backspace
local is_emmet_active = lvim.builtin.cmp.is_emmet_active
lvim.builtin.cmp.mapping = cmp.mapping.preset.insert {
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<C-j>"] = cmp.mapping.select_next_item(),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  -- TODO: potentially fix emmet nonsense
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      -- cmp.select_next_item()
    elseif luasnip.expandable() then
      luasnip.expand()
    elseif jumpable() then
      luasnip.jump(1)
    elseif check_backspace() then
      fallback()
    elseif is_emmet_active() then
      return vim.fn["cmp#complete"]()
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp_ultisnips_mappings.jump_backwards(fallback)
      -- cmp.select_prev_item()
    elseif jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),

  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<CR>"] = cmp.mapping(function(fallback)
    if cmp.visible() and cmp.confirm(lvim.builtin.cmp.confirm_opts) then
      if jumpable() then
        luasnip.jump(1)
      end
      return
    end

    if jumpable() then
      if not luasnip.jump(1) then
        fallback()
      end
    else
      fallback()
    end
  end),
}

lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm({ select = true })

local _, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

lvim.lsp.on_attach_callback = function(_, bufnr)

  local _, lsp_signature = pcall(require, "lsp_signature")
  lsp_signature.on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
end

local _, lspconfig = pcall(require, "lspconfig")
lspconfig.rls.setup {}


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
