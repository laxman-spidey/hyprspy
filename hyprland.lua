-- CachyOS Hyprland Configuration

require("config.animations")
require("config.autostart")
require("config.colors")
require("config.decorations")
require("config.variables")
require("config.environment")
require("config.inputs")
require("config.binds")
require("config.misc")
require("config.monitors")
require("config.windowrules")
require("config.workspaces")
require("noctalia").apply_theme()

-- HyprGlass liquid glass for Noctalia (loads the plugin + config)
require("config.hyprglass")


-- hl.config({
--     general = { gaps_in = 5, gaps_out = 10, border_size = 0 },  -- focus_light replaces the border
--     decoration = {
--         rounding = 32,
--         -- rounding_power = 2,
--         shadow = { enabled = true, range = 20, render_power = 3, color = 0x40000000 },
--         blur = { enabled = true, size = 8, passes = 3, vibrancy = 0.17 },  -- keeps glass edges fresh while dragging
--     },
-- })

hl.layer_rule({
    name = "noctalia",
    match = { namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$" },
    no_anim = true,
})