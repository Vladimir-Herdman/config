return {
    {
        'goolord/alpha-nvim',
        config = function()
            math.randomseed(os.time())

            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }

            dashboard.section.buttons.val = {
                dashboard.button( "e", "  > New File" , ":ene <BAR> startinsert <CR>"),
                dashboard.button( "f", "  > Find File", "<cmd>cd $HOME<CR> | <Leader>tf"),
                dashboard.button( "g", "  > Find Word", "<cmd>cd $HOME<CR> | <Leader>tg"),
                dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
                dashboard.button( "u", "  > Update Plugins" , "<cmd>Lazy sync<CR>"),
                dashboard.button( "q", "  > Quit NVIM", "<cmd>qa<CR>"),
            }

            -- Do random here to choose personal or original fortunes/quotes
            local fortune = require("config.vova.personal_fortune")
            dashboard.section.footer.val = fortune()

            alpha.setup(dashboard.opts)
        end,
    }
}
