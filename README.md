# Hyprland Config (Noctalia)

Modular [Hyprland](https://hyprland.org/) Wayland compositor configuration, themed with the [Noctalia](https://github.com/noctalia-theme) color palette.

## Quick Start

1. Ensure you have **Hyprland** and **Noctalia** installed.
2. This config lives in `~/.config/hypr/`.
3. Apply changes on the fly:

   ```bash
   hyprctl reload
   ```

4. Or log out / back in for a full reinitialization.

> ⚠️ Malformed Lua will prevent Hyprland from starting — validate your config before reloading.

## Structure

```
hypr/
├── hyprland.lua          # Main entry point; requires all modules
├── noctalia.lua          # Noctalia color theme (applied via hl.config())
└── config/               # Split configuration modules
    ├── variables.lua     # Global vars: apps, monitors, workspace counts
    ├── binds.lua         # Keybindings and mouse actions
    ├── workspaces.lua    # Workspace rules and naming
    └── autostart.lua     # Startup applications and services
```

New settings should go in the appropriate `config/` module rather than `hyprland.lua`.

## Default Apps

| Variable       | App                  |
|----------------|----------------------|
| `TERMINAL`     | kitty                |
| `FILE_MANAGER` | dolphin              |
| `BROWSER`      | firefox              |
| `EDITOR`       | gnome-text-editor    |
| `CALCULATOR`   | gnome-calculator     |

Edit these in `config/variables.lua`.

## Keybindings (Super = `SUPER`)

### Window Management
- **Super + Q** — Close window
- **Super + F / D** — Toggle / set fullscreen
- **Super + J** — Toggle split
- **Super + Alt + Space** — Float toggle
- **Super + Arrows** — Focus direction
- **Alt + Tab** — Cycle windows
- **Super + Tab** — Window switcher (Noctalia)

### Workspace Navigation
- **Super + 1–9 / 0** — Switch to workspace on current monitor
- **Super + Alt + 1–9 / 0** — Absolute workspace focus
- **Super + Ctrl + 1–9 / 0** — Relative workspace focus
- **Super + Ctrl + ←/→** — Move to adjacent workspace
- **Super + Ctrl + ↓** — Focus next empty workspace
- **Super + Scroll wheel** — Cycle workspaces

### Moving Windows
- **Super + Shift + Arrows** — Move window in direction
- **Super + Shift + mouse_up/down** — Move between monitors
- **Super + Ctrl + Shift + ←/→** — Move to adjacent monitor's workspace
- **Super + S** — Toggle special (scratchpad) workspace

### Launchers & Apps
- **Super + Return** — Terminal (kitty)
- **Super + E** — File manager (dolphin)
- **Super + T** — Editor
- **Super + W** — Browser (firefox)
- **Super + C / XF86Calculator** — Calculator
- **Ctrl + Shift + Escape** — btop in terminal

### Noctalia Panels
- **Super + Space** — Launcher toggle
- **Super + period** — Emoji picker
- **Super + X** — Control center panel
- **Super + Z** — Settings toggle
- **Super + A** — Notifications panel
- **Super + V** — Clipboard panel
- **Super + Shift + W** — Wallpaper selector

### Media & System
- **XF86AudioPlay/Pause/Next/Prev** — Media controls
- **XF86MonBrightnessUp/Down** — Brightness
- **XF86AudioLowerVolume / XF86AudioMute / XF86AudioMicMute** — Volume
- **Super + P** — Color picker (hyprpicker)
- **Print** — Region screenshot
- **Super + Print** — Fullscreen screenshot

### Misc
- **Super + Escape** — Kill focused client
- **Super + mouse drag / resize** — Move / resize window
- **Super + +/- or Numpad -/+** — Zoom cursor (1.0–3.0)
- **Super + G** — Launch Steam via gamescope + MangoHud

## Monitors

Configure your displays in `config/variables.lua`:

```lua
MONITOR1 = "your-monitor-name"   -- primary
MONITOR2 = ""                    -- secondary (leave blank for auto-detect)
MONITOR3 = ""
```

Leave values empty for Hyprland to auto-detect.

## Layouts

- **Default:** Dwindle (`preserve_split` enabled)
- **Master** and **Scrolling** layouts also configured
- Gaps: `in = 1`, `out = 8`
- Rounded corners: `10px` (with blur enabled, size `3`)

## Animations & Curves

Smooth animations are enabled with custom bezier curves (`easeOutQuint`, `easeInOutCubic`, etc.) and a spring curve for window animations.

## Dependencies

- [Hyprland](https://github.com/hyprwm/Hyprland)
- [Noctalia](https://github.com/noctalia-theme) — color theme & panel system
- [UWSM](https://github.com/vn971/UWSM) — session manager (autostart uses `uwsm app --`)

## Customization Tips

- **Theme colors** are centralized in `noctalia.lua` — edit there, not scattered across modules.
- **Keybindings** live in `config/binds.lua`.
- **Workspace rules** go in `config/workspaces.lua`.
- **Startup apps/services** belong in `config/autostart.lua`.
- Permission changes (e.g., `hl.permission()`) require a full Hyprland restart.

## License

This configuration is provided as-is for personal use.
