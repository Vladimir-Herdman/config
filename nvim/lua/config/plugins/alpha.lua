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
                dashboard.button( "f", "  > Find File", "<cmd>cd $HOME<CR> | <leader>tf"),
                dashboard.button( "g", "  > Find Word", "<cmd>cd $HOME<CR> | <leader>tg"),
                dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
                dashboard.button( "u", "  > Update Plugins" , "<cmd>Lazy sync<CR>"),
                dashboard.button( "q", "  > Quit NVIM", "<cmd>qa<CR>"),
            }

            -- Do random here to choose personal or original fortunes/quotes
            local fortune
            if (math.random(1, 4) > 2) then
                fortune = require("alpha.fortune")
            else
                fortune = require("config.personal_fortune")
            end
            dashboard.section.footer.val = fortune()

            alpha.setup(dashboard.opts)
        end,
    }
}
