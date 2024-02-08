-- LSP support
local M = { "neovim/nvim-lspconfig" }
local user = {}
local util = require('util')

M.dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
}

M.cmd = 'Lsp'

function M.init()
    vim.g.lsp_zero_extend_cmp = 0
    vim.g.lsp_zero_extend_lspconfig = 0

    -- disable lsp semantic highlights
    vim.api.nvim_create_autocmd('ColorScheme', {
        desc = 'Clear LSP highlight groups',
        callback = function()
            local higroups = vim.fn.getcompletion('@lsp', 'highlight')
            for _, name in ipairs(higroups) do
                vim.api.nvim_set_hl(0, name, {})
            end
        end,
    })
end

function M.config()
    local lz = util.load_module('lsp-zero')

    user.lspconfig(lz)
    user.diagnostics(lz)

    util.load_module('mason-lspconfig').setup({})

    vim.api.nvim_create_user_command(
        'Lsp',
        function(input)
            if input.args == '' then
                return
            end

            lz.use(input.args, {})
        end,
        { desc = 'Initialize a language server', nargs = '?' }
    )
end

function user.lspconfig(lsp)
    lsp.extend_lspconfig()

    lsp.on_attach(user.lsp_attach)

    lsp.set_server_config({
        single_file_support = false,
        root_dir = function()
            return vim.fn.getcwd()
        end,
    })

    lsp.store_config('tsserver', {
        settings = {
            completions = {
                completeFunctionCalls = true
            }
        }
    })

    local configs = util.load_module('lspconfig.configs')

    configs.nvim_lua = {
        default_config = lsp.nvim_lua_ls({
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
        })
    }
end

local _opts = function(base, additions)
    local copy = {}
    for key, value in pairs(base) do
        copy[key] = value
    end
    for key, value in pairs(additions) do
        copy[key] = value
    end
    return copy
end

function user.lsp_attach(_, bufnr)
    local telescope = util.load_module('telescope.builtin')
    local lsp = vim.lsp.buf
    local bind = vim.keymap.set
    local command = vim.api.nvim_buf_create_user_command

    command(0, 'LspFormat', function(input)
        vim.lsp.buf.format({ async = input.bang })
    end, {})

    local common_opts = { silent = true, buffer = bufnr }

    bind('n', 'gq', '<cmd>LspFormat<cr>', common_opts)

    bind('n', 'K', lsp.hover, _opts(common_opts, { desc = "Hover" }))
    bind('n', 'gd', lsp.definition, _opts(common_opts, { desc = "Go to definition" }))
    bind('n', 'gD', lsp.declaration, _opts(common_opts, { desc = "Go to declaration" }))
    bind('n', 'gi', lsp.implementation, _opts(common_opts, { desc = "Go to implementation" }))
    bind('n', 'go', lsp.type_definition, _opts(common_opts, { desc = "Type definition" }))
    bind('n', 'gr', lsp.references, _opts(common_opts, { desc = "References" }))
    bind('n', 'gs', lsp.signature_help, _opts(common_opts, { desc = "Signature help" }))
    bind('n', '<F2>', lsp.rename, _opts(common_opts, { desc = "Rename..." }))
    bind('n', '<F4>', lsp.code_action, _opts(common_opts, { desc = "Code Action" }))

    bind('n', 'gl', vim.diagnostic.open_float, _opts(common_opts, { desc = "Open Float" }))
    bind('n', '[d', vim.diagnostic.goto_prev, _opts(common_opts, { desc = "Diagnostic (Prev)" }))
    bind('n', ']d', vim.diagnostic.goto_next, _opts(common_opts, { desc = "Diagnostic (Next)" }))

    bind('n', '<leader>fd', telescope.lsp_document_symbols, _opts(common_opts, { desc = "Symbols (Document)" }))
    bind('n', '<leader>fq', telescope.lsp_workspace_symbols, _opts(common_opts, { desc = "Symbols (Workspace)" }))
end

function user.diagnostics(lsp)
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    })

    vim.diagnostic.config({
        virtual_text = false,
    })

    local group = augroup('diagnostic_cmds', { clear = true })

    autocmd('ModeChanged', {
        group = group,
        pattern = { 'n:i', 'v:s' },
        desc = 'Disable diagnostics while typing',
        callback = function(e) vim.diagnostic.disable(e.buf) end
    })

    autocmd('ModeChanged', {
        group = group,
        pattern = 'i:n',
        desc = 'Enable diagnostics when leaving insert mode',
        callback = function(e) vim.diagnostic.enable(e.buf) end
    })
end

return M
