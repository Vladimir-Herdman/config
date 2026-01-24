--_G.LAZY_LOAD_ON_FILE = { "lua", "python", "cpp", "c", "javascript", "typescript", "java", "sh", "zsh", "markdown", "html", "css", }
--TODO: on <leader>l or <leader>h, if only one current tab, then make a new one
require("config.lazy")
require("config.vova.set")
require("config.vova.keymap")
require("config.vova.autocmd")
require("config.vova.user_commands")
