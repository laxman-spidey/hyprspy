# Repository Guidelines

This repository contains the [Hyprland](https://hyprland.org/) Wayland compositor configuration, organized as a modular Lua-based dotfiles setup.

## Project Structure & Module Organization

```
hypr/
├── hyprland.lua          # Main entry point; requires all config modules
├── noctalia.lua          # Color theme (Noctalia palette) applied via hl.config()
└── config/               # Split configuration modules
    ├── variables.lua     # Global variables: apps, monitors, workspace counts
    ├── binds.lua         # Keybindings and mouse actions
    ├── workspaces.lua    # Workspace rules and naming
    └── autostart.lua     # Startup applications and services
```

The main `hyprland.lua` file requires each module in order. New settings should be placed in the appropriate submodule rather than edited directly in the entry point.

## Build, Test, and Development Commands

This is a configuration repository — there is no build step or test suite. To apply changes:

```bash
# Restart Hyprland to pick up config changes (from within a Hyprland session)
hyprctl reload
```

Or log out and back in for full reinitialization. Always validate syntax before reloading; malformed Lua will prevent Hyprland from starting.

## Coding Style & Naming Conventions

- **Language:** Lua (Hyprland's native config format).
- **Indentation:** 4 spaces, no tabs.
- **Naming:** Global variables use `UPPER_SNAKE_CASE` (e.g., `TERMINAL`, `MONITOR1`). Local variables and function names use `lowercase_with_underscores`.
- **Comments:** Use `--` for single-line comments; group related settings with section headers.
- **Line length:** Keep lines under 100 characters where practical.
- **Requires:** Module paths in `require()` calls are relative to the config directory (e.g., `require("config.binds")`).

## Commit Guidelines

The project follows a simple convention observed in its history:

```
<short imperative description>
```

Examples:

```
update binds for media keys
add noctalia color theme
refactor workspace rules into separate module
```

- Use the imperative mood ("add" not "added").
- Keep subjects under 72 characters.
- Reference related issues or PRs when applicable.

## Security & Configuration Tips

- **Permissions:** Hyprland permission changes (e.g., `hl.permission()`) require a full restart and are not applied on-the-fly. Review carefully before committing.
- **Environment variables:** Set via `hl.env()` in the main config; avoid hardcoding secrets in shared configs.
- **Monitors:** Edit `MONITOR1`, `MONITOR2`, etc. in `config/variables.lua` to match your display setup. Leave blank for auto-detection.

## Agent-Specific Instructions

When modifying this repo:

1. Always edit the relevant module under `config/` rather than `hyprland.lua`.
2. Keep theme colors centralized in `noctalia.lua`; do not scatter color literals across modules.
3. After changes, verify that `require()` paths remain valid and no circular dependencies are introduced.
4. Run `hyprctl reload` to validate the config before committing.
