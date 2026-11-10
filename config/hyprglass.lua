
local noctalia = require("noctalia")

hl.plugin.load("/var/cache/hyprpm/batman/HyprGlass/hyprglass.so")

if not hl.plugin.hyprglass then
    print("[hyprland] hyprglass: plugin failed to load, glass disabled")
    return
end

local hg = hl.plugin.hyprglass

local FALLBACK_TINT = "ffffff18"

local function tint(alpha)
    local s = noctalia.colors and noctalia.colors.glass_tint
    s = (type(s) == "string") and (s:gsub("^0[xX]", "")) or FALLBACK_TINT
    if #s ~= 8 then s = FALLBACK_TINT end
    if alpha then s = s:sub(1, 6) .. string.format("%02x", alpha) end
    return tonumber(s, 16)
end

hg.config({
    default_theme  = "dark",   -- matches [theme] mode in ~/.config/noctalia
    default_preset = "apple",  -- windows
    brightness     = 1.0,
    dark           = { brightness = 1.0 },
    light          = { adaptive_boost = 0.5 },
    layers = {
        enabled           = true,
        mask_threshold    = 0.15,  -- keep above shadow opacity to avoid halos
        mask_feather      = 0.2,   -- smooth antialiased rounded corners
        -- live_resample_fps = 30,
    },
})

hg.preset("apple", {
    inherits             = "glass",

    edge_height          = 32,    -- rim bend steepness (20-40)
    edge_thickness_px    = 20,    -- rim width in px (16-24)
    fresnel_reflection   = 0.5,
    chromatic_aberration = 0.3,

    blur_strength        = 0.4,   -- low, heavy blur hides the lens
    blur_iterations      = 2,
    lens_distortion      = 0.1,
    noise_strength       = 0.0,

    fresnel_strength     = 0.5,
    specular_strength    = 0.8,
    specular_angle       = 330,
    bevel_strength       = 0.6,
    bevel_size           = 2.0,
    bevel_angle          = 315,
    bevel_shadow         = 0.35,
    bevel_tint           = 0.35,

    dark  = { brightness = 0.95, saturation = 1.2, vibrancy = 0.5,
              tint_color = 0xffffff10, adaptive_dim = 0.5 },
    light = { brightness = 1.05, saturation = 1.05,
              tint_color = 0xffffff18, adaptive_boost = 0.2 },
})

hg.preset("panels", {
    inherits             = "apple",
})

hg.preset("pane", {
    inherits             = "panels",
})

hg.preset("widgets", {
    inherits             = "panels",
    bevel_size           = 1.0,
    blur_strength        = 0.1,
    edge_thickness_px    = 10, 
    edge_height          = 8,
})
hg.layer("noctalia-bar-default",     { preset = "panels" })
hg.layer("noctalia-dock",            { preset = "panels", mask_mode = "contour" })
hg.layer("noctalia-panel",           { preset = "panels" })
hg.layer("noctalia-launcher",           { preset = "panels" })
hg.layer("noctalia-attached-panel",  { preset = "panels" })

hg.layer("noctalia-notification",    { preset = "pane", mask_feather = 0.2 })
hg.layer("noctalia-osd",             { preset = "widgets", })
hg.layer("noctalia-window-switcher", { preset = "pane", })

hg.layer("noctalia-desktop-.*",       { preset = "glass", mask_mode = "alpha" })
hg.layer("noctalia-desktop-widget-sysmon-0000000000000002",       { preset = "widgets"})
hg.layer("noctalia-desktop-widget-volume-0000000000000003",       { preset = "widgets"})
hg.layer("noctalia-desktop-widget-media_player-0000000000000004",       { preset = "widgets"})
hg.layer("noctalia-desktop-widget-sysmon-0000000000000005",       { preset = "widgets"})


hl.window_rule({ match = { class = "mpv" },     tag = "+hyprglass_disabled" })
hl.window_rule({ match = { fullscreen = true }, tag = "+hyprglass_disabled" })
