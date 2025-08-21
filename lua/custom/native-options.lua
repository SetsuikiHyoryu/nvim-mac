-- Neovim 原生即有的配置项。

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- NOTE: You should make sure your terminal supports this
-- 0.10+ 自动检测是否可用真彩色，可用则启动。此处为了兼容低版本，我仍旧保留了手动启用。
-- see: https://gpanders.com/blog/whats-new-in-neovim-0.10/#hyperlinks
vim.o.termguicolors = true

-- Make line numbers default
vim.o.number = true
-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'
-- 禁用鼠标
vim.o.mouse = ''
-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
-- Enable break indent
vim.o.breakindent = true
-- 隐藏命令行（在输入命令时会临时覆盖状态栏）
-- vim.o.cmdheight = 0

-- 创建切换光标行是否显示的命令
vim.api.nvim_create_user_command('ToggleCursorline', function()
  vim.opt.cursorline = not vim.opt.cursorline:get()
end, {})

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- 强化 Markdown 中链接的渲染输出
-- see: https://gpanders.com/blog/whats-new-in-neovim-0.10/#hyperlinks
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown' },
  once = true,

  callback = function()
    vim.o.conceallevel = 2
  end,
})

-- [[ Diagnostic keymaps ]]
-- 0.10+ 中已经内置 `[d`, `]d`, `CTRL-W_d` 映射
-- see: https://neovim.io/doc/user/news-0.10.html
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
