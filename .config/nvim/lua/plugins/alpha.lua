-----------------------------------------------------------
-- Dashboard Configuration
-----------------------------------------------------------

-- Plugin: alpha
-- url: https://github.com/lukas-reineke/indent-blankline.nvim

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local date = os.date("Today is %a %d %b")

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[██████╗  ██████╗ ██╗  ██╗███████╗██╗   ██╗██╗███╗   ███╗ ]],
  [[██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝██║   ██║██║████╗ ████║ ]],
  [[██████╔╝██║   ██║█████╔╝ █████╗  ██║   ██║██║██╔████╔██║ ]],
  [[██╔═══╝ ██║   ██║██╔═██╗ ██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
  [[██║     ╚██████╔╝██║  ██╗███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
  [[╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
}
-- dashboard.section.header.val = {
-- [[                           /|                                                   ]],
-- [[                /`     |   / |                                                  ]],
-- [[               . |     |`.'  |  ,          .                                    ]],
-- [[               | |     |     `"'/       _,'           ,"'                       ]],
-- [[               | |     |       /      ." ,'         ,'/_                        ]],
-- [[               | |   ,"| .-"""''`,`.,'  /      /|  /  ' )                       ]],
-- [[     .'.       | |""+._|'   .    '     ,__    / ) /   .'                        ]],
-- [[      `.`.   .'| |     '_,".`     \     .'   '   '   /  _                       ]],
-- [[        `.`./ j  |  _,-'_,'.       `-..'    .        `-'/                       ]],
-- [[         _\' `   |," _.' `. `.     _..|     |         ,'                        ]],
-- [[ .    ."'  \._____.-' '    `-|  .-'  ,|    _|   ___  /                          ]],
-- [[  \`._ `-. `|.___,'| /     _.'      / |  ," |.-'   `.'.                         ]],
-- [[   \-.`"-'  _______`'    ,' __.---.' ,^.' _.'_    __ `.`.                       ]],
-- [[   |    `-.,...... `.   |,-"     / .'. |-'    `-."  | |` \                      ]],
-- [[   '      ||\/  |/`.|  .`       (,'   `|         `.'  '.| \                     ]],
-- [[   `-..--.||       || j      ____\     |       _  |  /     `.---------.         ]],
-- [[      |   ||  ___..|||,.--""'|.      ."|     ,' | |"/ `. ,'. .   ,.--"          ]],
-- [[      |  .||.'      ||.._    ' )  _,'\ |`'-.'   | |/    ||.' |   `.             ]],
-- [[      |,',|||      . |"-.`._  `+`"    "      `.'  ^,.__,'.   |  ,--'            ]],
-- [[       // |||      |j  |\\  "'  `.     |   ,-` `./ '     |   |`.\               ]],
-- [[      .'  |||      ||  | .'      |   ."`..|_ |  .   \    |  /|                  ]],
-- [[      ||  ||`.___.'f   ' ||     ,'--"`._|,-.`|  '    +.._|,'.|                  ]],
-- [[      ||  |`-.....'|    .'`.""'`.       /\ | `.'     |    |  |                  ]],
-- [[ .'`  ''   `--....-'    | \|   ``\     '  \|   |     |`._,'-"'                  ]],
-- [[ |`..''                 |  '    )|.   /`..|'   '     |   \  /                   ]],
-- [[  `""'                  |   `-..''|  /    |   /    _.."`.` /                    ]],
-- [[                        `         |,'     |  /  ,"'_,|     \                    ]],
-- [[                         `,_   _.-'.      |,' .'-'"  '    , \                   ]],
-- [[                          `.""'     `.   .' .'      /   ,' | .                  ]],
-- [[                            `._       \,'  .       /   /   | |                  ]],
-- [[                               `"----"'     \  _  /  ,'    | |                  ]],
-- [[                                             `" 7._,`      | |                  ]],
-- [[                                                    \      | '                  ]],
-- [[                                                     `-. ,.|/                   ]],
-- [[                                                        '  |                    ]],
-- [[                                                                                ]],
-- }

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("d", "  Open directory", ":Telescope file_browser <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "- nvim config by williamong1400@gmail.com -"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
