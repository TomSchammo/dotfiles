local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- colorscheme
    "tomschammo/gruvbox.nvim",
    -- 'kyazdani42/nvim-web-devicons',

    -- comment.nvim
    "numToStr/Comment.nvim",

    -- Mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- vim-surround
    "tpope/vim-surround",

    -- Vim Man Page
    "vim-utils/vim-man",

    -- Basic Git integration
    "tpope/vim-fugitive",

    -- Make Git integration prettier
    "mhinz/vim-signify",

    -- Telescope for fuzzy finding
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "danymat/neogen", cmd = "Neogen", keys = "<leader>do" },

    -- Neovim built-in lsp
    "neovim/nvim-lspconfig",

    -- Neovim built-in lsp autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",

    -- ltex-ls non standard features
    "barreiroleo/ltex-extra.nvim",

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- Debugging
    -- "mfussenegger/nvim-dap",
    -- "rcarriga/nvim-dap-ui",
    -- "theHamsta/nvim-dap-virtual-text",
    -- "nvim-telescope/telescope-dap.nvim",

    -- python debugging
    -- "mfussenegger/nvim-dap-python",

    -- rust stuff
    "simrat39/rust-tools.nvim",

    -- flutter stuff
    {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
        config = true,
    },

    -- Autopairs
    "windwp/nvim-autopairs",

    -- Autoformatting
    "mhartington/formatter.nvim",

    -- Codi for scratchpad and virtual text
    "metakirby5/codi.vim",

    "nvim-lualine/lualine.nvim",

    -- vim signature to manage marks
    "kshenoy/vim-signature",

    -- bufferline
    { "akinsho/bufferline.nvim", version = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },

    { "tpope/vim-obsession", cmd = "Obsession" },

    -- obsidian
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        -- event = { "BufReadPre path/to/my-vault/**.md" },
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
        event = {
            "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Obsidian/**.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian/**.md",
        },
        -- event = { "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Obsidian/" },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- Optional, for completion.
            "hrsh7th/nvim-cmp",

            -- Optional, for search and quick-switch functionality.
            "nvim-telescope/telescope.nvim",

            -- Optional, an alternative to telescope for search and quick-switch functionality.
            -- "ibhagwan/fzf-lua"

            -- Optional, another alternative to telescope for search and quick-switch functionality.
            -- "junegunn/fzf",
            -- "junegunn/fzf.vim"

            -- Optional, alternative to nvim-treesitter for syntax highlighting.
            -- "godlygeek/tabular",
            -- "preservim/vim-markdown",
        },
        opts = {
            workspaces = {
                {
                    name = "Obsidian Vault",
                    path = "~/Documents/Obsidian/",
                },
            },

            -- Optional, if you keep notes in a specific subdirectory of your vault.
            -- notes_subdir = "notes",

            -- Optional, set the log level for Obsidian. This is an integer corresponding to one of the log
            -- levels defined by "vim.log.levels.*" or nil, which is equivalent to DEBUG (1).
            log_level = vim.log.levels.DEBUG,

            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "notes/dailies",
                -- Optional, if you want to change the date format for the ID of daily notes.
                date_format = "%Y-%m-%d",
                -- Optional, if you want to change the date format of the default alias of daily notes.
                alias_format = "%B %-d, %Y",
                -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                template = nil,
            },

            -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
            completion = {
                -- Set to false to disable completion.
                nvim_cmp = true,

                -- Trigger completion at 2 chars.
                min_chars = 2,

                -- Where to put new notes created from completion. Valid options are
                --  * "current_dir" - put new notes in same directory as the current buffer.
                --  * "notes_subdir" - put new notes in the default notes subdirectory.
                new_notes_location = "current_dir",

                -- Control how wiki links are completed with these (mutually exclusive) options:
                --
                -- 1. Whether to add the note ID during completion.
                -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
                -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
                prepend_note_id = true,
                -- 2. Whether to add the note path during completion.
                -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
                -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
                prepend_note_path = false,
                -- 3. Whether to only use paths during completion.
                -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
                -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
                use_path_only = false,
            },

            -- Optional, customize how names/IDs for new notes are created.
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,

            -- Optional, customize the backlinks interface.
            backlinks = {
                -- The default height of the backlinks pane.
                height = 10,
                -- Whether or not to wrap lines.
                wrap = true,
            },

            -- Optional, set to true if you don't want Obsidian to manage frontmatter.
            disable_frontmatter = false,

            -- Optional, alternatively you can customize the frontmatter data.
            -- TODO: add table to lua that lists the languages with file path to
            --       autmatically add 'lang' property
            note_frontmatter_func = function(note)
                local out = { id = note.id, aliases = note.aliases, tags = note.tags }

                -- `note.metadata` contains any custom fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,

            -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
            -- URL it will be ignored but you can customize this behavior here.
            follow_url_func = function(url)
                -- Open the URL in the default web browser.
                -- vim.fn.jobstart({ "open", url }) -- Mac OS
                vim.fn.jobstart({ "xdg-open", url }) -- linux
            end,

            -- Optional, set to true if you use the Obsidian Advanced URI plugin.
            -- https://github.com/Vinzent03/obsidian-advanced-uri
            use_advanced_uri = true,

            -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
            open_app_foreground = false,

            -- Optional, by default commands like `:ObsidianSearch` will attempt to use
            -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
            -- first one they find. By setting this option to your preferred
            -- finder you can attempt it first. Note that if the specified finder
            -- is not installed, or if it the command does not support it, the
            -- remaining finders will be attempted in the original order.
            finder = "telescope.nvim",

            -- Optional, sort search results by "path", "modified", "accessed", or "created".
            -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example `:ObsidianQuickSwitch`
            -- will show the notes sorted by latest modified time
            sort_by = "modified",
            sort_reversed = true,

            -- Optional, determines whether to open notes in a horizontal split, a vertical split,
            -- or replacing the current buffer (default)
            -- Accepted values are "current", "hsplit" and "vsplit"
            open_notes_in = "current",

            -- Optional, set the YAML parser to use. The valid options are:
            --  * "native" - uses a pure Lua parser that's fast but not very robust.
            --  * "yq" - uses the command-line tool yq (https://github.com/mikefarah/yq), which is more robust
            --    but slower and needs to be installed separately.
            yaml_parser = "native",
        },
        config = function(_, opts)
            require("obsidian").setup(opts)

            -- Optional, override the 'gd' keymap to utilize Obsidian's search functionality.
            -- see also: 'follow_url_func' config option above.
            -- vim.keymap.set("n", "gf", function()
            --     if require("obsidian").util.cursor_on_markdown_link() then
            --         return "<cmd>ObsidianFollowLink<CR>"
            --     else
            --         return "gf"
            --     end
            -- end, { noremap = false, expr = true })

            -- Use ObsidianSearch instead of telescope live_grep if in obsidian vault
            vim.keymap.set("n", "<C-s>", "<cmd>ObsidianSearch<CR>", { noremap = true })

            -- Use ObsidianRename instead of `vim.lsp.buf.rename`
            vim.keymap.set("n", "<leader>rr", "<cmd>:ObsidianRename<CR>", { noremap = true })
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
local opts = {}

require("lazy").setup(plugins, opts)
