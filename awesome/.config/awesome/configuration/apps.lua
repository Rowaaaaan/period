local dpi = require("beautiful.xresources").apply_dpi
local menubar = require("menubar")

apps = {

	-- Your default terminal
	terminal                      = "kitty" or "alacritty" or os.getenv("TERM"),

	-- Your default text editor
	editor                        = os.getenv("EDITOR") or "nvim" or "vim",

	-- editor_cmd                 = terminal .. " -e " .. editor,

	-- Your default file explorer
	explorer                      = "thunar" or "pcmanfm",

	launcher                      = "rofi -show-icons -show combi -combi-modi 'window,drun,run'",

	calculator                    = "rofi -show calc",

	scrlocker                     = os.getenv("HOME") .. "/.local/bin/scripts/lock",

	powermenu					  = os.getenv("HOME") .. "/.local/bin/powermenu.sh",

	browser                       = "firefox",

	chat_app					  = "signal-desktop",

	term_explorer = "ranger"
}

apps.editor_cmd   = apps.terminal .. " -e " .. apps.editor
apps.explorer_cmd = apps.terminal .. " -e " .. apps.explorer
apps.term_explorer_cmd = apps.terminal .. " -e " .. apps.term_explorer
menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it


return apps
