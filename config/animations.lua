local animation = {
    name = "Celestia-style Smooth Animations",
    icon = "✦",
    description = "Smooth, organic animations for all window operations"
}

if not hl then
    return animation
end

-- ============================================================
-- Global config — enables animations and sets base behavior
-- ============================================================

hl.config({
    animations = {
        enabled = true,
    },
    misc = {
        animate_manual_resizes   = true,
        animate_mouse_windowdragging = true,
    },
})

-- ============================================================
-- Custom bezier curves (smooth easing)
-- ============================================================

hl.curve("emphasizedDecel", {
    type = "bezier",
    points = {{0.05, 0.7}, {0.1, 1}}
})
hl.curve("emphasizedAccel", {
    type = "bezier",
    points = {{0.3, 0}, {0.8, 0.15}}
})
hl.curve("standardDecel", {
    type = "bezier",
    points = {{0, 0}, {0.2, 1}}
})
hl.curve("menu_decel", {
    type = "bezier",
    points = {{0, 0}, {0.1, 1}}
})
hl.curve("menu_accel", {
    type = "bezier",
    points = {{0.52, 0.03}, {0.72, 0.08}}
})
hl.curve("stall", {
    type = "bezier",
    points = {{0.3, -0.1}, {0.7, 0.85}}
})

-- Extra smooth curves for buttery transitions
hl.curve("smoothDecel", {
    type = "bezier",
    points = {{0, 0}, {0.25, 1}}
})
hl.curve("gentleOut", {
    type = "bezier",
    points = {{0, 0}, {0.3, 1}}
})
hl.curve("gentleIn", {
    type = "bezier",
    points = {{0.7, 0}, {1, 0}}
})

-- ============================================================
-- Animation definitions — high speeds for slow, smooth transitions
-- ============================================================

-- Windows open/close — slow pop-in with easing
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4,
    bezier = "emphasizedDecel",
    style = "popin 80%"
})
hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 5,
    bezier = "smoothDecel"
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 5,
    bezier = "emphasizedAccel",
    style = "slide right"
})

-- Parent windows — controls resize of remaining windows when one opens/closes
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    bezier = "emphasizedDecel",
    style = "slide"
})
hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 5,
    bezier = "smoothDecel"
})

-- Window move — buttery slide
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 4,
    bezier = "emphasizedDecel",
    style = "slide"
})

-- Border color transitions — slow gradient feel
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 6,
    bezier = "smoothDecel"
})

-- Shadow animations
hl.animation({
    leaf = "fadeShadow",
    enabled = true,
    speed = 5,
    bezier = "gentleOut"
})

-- Layer transitions — slow pop-in/out
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "emphasizedDecel",
    style = "popin 93%"
})
hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 5,
    bezier = "menu_accel",
    style = "popin 94%"
})

-- Fade layers — gentle and slow
hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 5,
    bezier = "gentleOut"
})
hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 4,
    bezier = "stall"
})

-- Fade switch (tab switching) — smooth crossfade
hl.animation({
    leaf = "fadeSwitch",
    enabled = true,
    speed = 5,
    bezier = "gentleOut"
})

-- Fade dim — subtle opacity transitions
hl.animation({
    leaf = "fadeDim",
    enabled = true,
    speed = 4,
    bezier = "smoothDecel"
})

-- Workspace switching — slow slide for buttery feel
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "menu_decel",
    style = "slide"
})

-- Special workspace (floating/special) — smooth slidevert
hl.animation({
    leaf = "specialWorkspaceIn",
    enabled = true,
    speed = 4,
    bezier = "emphasizedDecel",
    style = "slidevert"
})
hl.animation({
    leaf = "specialWorkspaceOut",
    enabled = true,
    speed = 5,
    bezier = "emphasizedAccel",
    style = "slidevert"
})

-- Zoom — smooth zoom transitions
hl.animation({
    leaf = "zoomFactor",
    enabled = true,
    speed = 4,
    bezier = "standardDecel"
})
