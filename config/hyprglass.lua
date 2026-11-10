-- HyprGlass liquid glass for Noctalia (https://github.com/hyprnux/hyprglass)
-- The plugin is managed by HyprPM; this module loads it and configures the
-- glass for Noctalia's bar, panels and dock. Tints come from noctalia.lua.

local noctalia = require("noctalia")

hl.plugin.load("/var/cache/hyprpm/batman/HyprGlass/hyprglass.so")

if not hl.plugin.hyprglass then
    print("[hyprland] hyprglass: plugin failed to load, glass disabled")
    return
end

-- Convert palette hex strings ("0xbd93f914") to the 0xRRGGBBAA numbers
-- HyprGlass expects; tonumber rejects the "0x" prefix with an explicit base.
local function hex_color(s)
    return tonumber(string.gsub(s, "^0[xX]", ""), 16)
end

local hg = hl.plugin.hyprglass

-- Global defaults. Windows keep the built-in "glass" preset (opaque windows
-- are skipped automatically); Noctalia's layer surfaces get the presets
-- below instead via per-layer overrides. Tint is intentionally not set
-- globally: each preset carries its own, sourced from the Noctalia palette.
hg.config({
    default_theme  = "dark",   -- matches [theme] mode in ~/.config/noctalia
    default_preset = "glass",
    brightness     = 1.0,      -- neutral tone mapping (no auto-dim)
    dark           = { brightness = 1.0 },
    light          = { adaptive_boost = 0.5 },
    layers         = { enabled = true },
})

-- Presets -----------------------------------------------------------------

-- "noct": signature Noctalia liquid glass for always-visible chrome (bar,
-- panels, dock). A solid glossy slab: strong multi-pass blur, near-opaque
-- material, top-edge specular shine, powerful fresnel edge glow, gentle
-- refraction with subtle fringing and a thin lit bevel.
hg.preset("noct", {
    glass_opacity        = 0.9,   -- defined material; content reads as depth behind it
    blur_strength        = 2.5,   -- ~30px radius (value * 12)
    blur_iterations      = 2,     -- multi-pass Gaussian for a creamy look
    specular_strength    = 0.5,   -- top-edge highlight (the iOS signature shine)
    fresnel_strength     = 1.0,   -- powerful edge glow
    refraction_strength  = 0.8,   -- noticeable content bending at the edges
    refraction_flow      = 0.5,   -- balanced pull toward center / along edges
    chromatic_aberration = 0.4,   -- subtle spectral fringing
    lens_distortion      = 0.35,  -- gentle center dome magnification
    bevel_strength       = 0.5,   -- thin lit line along the glass edge
    contrast             = 1.2,   -- punchier tone mapping keeps text legible
    tint_color           = hex_color(noctalia.colors.glass_tint),
})

-- "pane": light frost for transient surfaces (notifications, OSD, window
-- switcher) so their text stays readable while feeling like the same glass.
hg.preset("pane", {
    inherits      = "subtle",
    glass_opacity = 0.75,
    blur_strength = 1.6,
    tint_color    = hex_color(noctalia.colors.glass_tint),
})

-- Layer surfaces ------------------------------------------------------------
-- Whitelist mode: only the namespaces below get glass; everything else is
-- left untouched (notably noctalia-wallpaper). Namespaces mirror the
-- Noctalia layer rule in config/windowrules.lua.
-- mask_threshold sits above shadow opacity so shadows don't trigger a glass
-- halo around the surface; raise it if you see halos, lower it if parts of
-- a translucent widget stop getting glassed. mask_feather blends the cut so
-- antialiased rounded corners (the bar's bottom radius) stay smooth.

local function glass_layer(namespace, preset)
    hg.layer(namespace, { preset = preset, mask_threshold = 0.15, mask_feather = 0.2 })
end

-- Always-visible chrome: signature liquid glass
glass_layer("noctalia-bar-default", "noct")
glass_layer("noctalia-dock",        "noct")
glass_layer("noctalia-panel",       "noct")
glass_layer("noctalia-attached-panel", "noct")

-- Transient surfaces: light frost for readability
glass_layer("noctalia-notification",    "pane")
glass_layer("noctalia-osd",             "pane")
glass_layer("noctalia-window-switcher", "pane")
