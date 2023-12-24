-- neovim settings
require("personal.keymaps")
require("personal.splits")
require("personal.general")

-- custom commands
require("personal.commands")

-- settings for different languages and file types
require("personal.python")
require("personal.rust")
require("personal.documents")

-- package manage
require("personal.lazy")

-- visual changes
require("personal.colorscheme")

-- utilities
require("personal.autopairs")
require("personal.comments")
require("personal.telescope")
require("personal.treesitter")

-- AI assistance
require("personal.tabnine")

-- LSP
require("personal.lsp")
require("personal.mason")

-- snippets
require("personal.snippets")

-- version control
require("personal.git")

-- tools
require("personal.neogen")
require("personal.autoformat")

-- buffer and status lines
require("personal.bufferline")
require("personal.statusline")
