---
name: wow-addon
description: Working on World of Warcraft (WoW) addon development and maintenance tasks, including Lua UI code, the WoW API, events, in-game debugging, API upgrades, and addon deployment/releases.
license: MIT
compatibility: opencode
metadata:
  audience: developers
  workflow: wow-addon
---

## When to use me

Use this skill for any task involving World of Warcraft addons: writing new addons, editing existing Lua code, understanding the WoW API or events, or debugging addon issues.

## Reference material

### Local WoW UI source mirror

The official WoW UI source (FrameXML) is mirrored at <https://github.com/Gethe/wow-ui-source>.
The WoW UI textures are mirrored at <https://github.com/Gethe/wow-ui-textures>.

If it is not already present, sync it to `~/projects` or `/tmp`.

```sh
git clone https://github.com/Gethe/wow-ui-source ~/projects/wow-ui-source
```

Branch names correspond to game clients:

- `live` — current retail patch (default branch)
- `ptr` / `ptr2` — Public Test Realm (upcoming retail patch)
- `beta` — beta / next expansion

Always use a branch matching the target client (usually `live`) before reading frames, templates, or functions. Reading Blizzard's own code is the most reliable way to understand how the default UI works.

### Online documentation

- Main API index: <https://warcraft.wiki.gg/wiki/World_of_Warcraft_API>
- Writing an addon guide: <https://warcraft.wiki.gg/wiki/Writing_a_Addon>

## Addon structure

A minimal addon is a folder plus a TOC file:

```
MyAddon/
├── MyAddon.toc
└── MyAddon.lua
```

TOC metadata directives:

- `## Interface: NNNN` — required; must match the client build or the addon is flagged out-of-date
- `## Title:`, `## Notes:`, `## Author:`, `## Version:`
- `## SavedVariables: MyDB` / `## SavedVariablesPerCharacter: MyCharDB` — persistent storage

Files load in TOC order, top to bottom. Every Lua file receives the addon's shared namespace:

```lua
local addonName, ns = ...
```

## Core patterns

- Create frames with `CreateFrame("Frame", name, parent)` and handle events with `frame:RegisterEvent(...)` plus `frame:SetScript("OnEvent", function(self, event, ...) end)`
- Read saved variables only after `ADDON_LOADED` fires for your addon; `PLAYER_LOGIN` is when the UI is fully ready
- The modern API is spread across 190+ `C_*` namespaces (e.g. `C_Item`, `C_Spell`, `C_Container`), but many legacy global functions (e.g. `UnitHealth`, `GetSpellInfo`, `SendChatMessage`) are still in common use
- Get the current interface number at runtime with `GetBuildInfo()`
- Assume retail unless told otherwise; the API differs significantly across Classic versions

## In-game debugging

Suggest these client commands when debugging addon issues:

- `/etrace` — trace events
- `/dump <expr>` — dump a Lua value (e.g. `/dump C_Item.GetItemInfo(...)`)
- `/fstack` — inspect frames under the cursor
- `/api` — in-game API documentation (`Blizzard_APIDocumentation` addon)

## Project conventions

Personal conventions. Follow these when working on personal projects.

Coding:

- Pure Lua, no XML, no external libraries or frameworks unless the project already uses them
- Module-per-file structure with shared namespace: `local _, addon = ...`; strings first in TOC load order
- User-facing strings in `strings.lua`, on the addon table (no localization framework)
- Single global SavedVariables (`*Conf`), defaults declared on the settings module, merged in on `ADDON_LOADED`
- Modern WoW APIs: `Settings.RegisterVerticalLayoutCategory` + `RegisterAddOnSetting` panel, `AddonCompartmentFunc` TOC directive + global click handler opening settings, `EventRegistry:RegisterCallback`, `Item:*` mixins, `C_Timer`, `C_*` namespaces
- Consider "secret" values, use `pcall`, `issecretvalue`, `issecrettable`, `canaccesstable`

Deployment:

- `Makefile` with `install` (copy into auto-detected `_retail_/Interface/AddOns`) and `release` (build `dist/<name>_v<ver>.zip` excluding `.*`, `assets/`, `dist/`)
- `pkgmeta.yaml` with `package-as` and `ignore: [assets]` for the BigWigs/CurseForge packager
- `LICENSE` (GPLv3), `README.md`, `RELEASE.md` release checklist, `dist/` gitignored
- Releases: CurseForge pipeline triggered by Github release version tag. Release: v1.0.0, Beta: v1.0.0-beta

## API upgrades and deployment

This skill's primary maintenance task is upgrading an addon for a new WoW patch and releasing it. This is the routine used by the user's addons (see their git history: most commits are `"update to <API_VERSION>"`):

1. Append the new build number to the comma-separated `## Interface:` line in the `.toc` (all supported versions stay listed, e.g. `110007, ..., 120100`). `## Interface:` must still contain every compatible build, not just the newest.
2. Bump `## Version:` in the `.toc` (patch bump for API updates).
3. Check for breaking changes at `https://warcraft.wiki.gg/wiki/Patch_<VERSION>/API_changes` and search the addon's source for removed/renamed APIs (lint configs like `.luarc.json` or `.vscode/settings.json` list the WoW globals in use, which is a good starting inventory).
4. Commit as `"update to <API_VERSION>"` and push.
5. Tag `v<VERSION>` and push the tag.
6. Create the release with `gh release create v<VERSION> --repo <REPO> --title "v<VERSION>" --generate-notes`.

When upgrading, first diff the `live` branch against `ptr`/`beta` in `~/projects/wow-ui-source` to see upcoming API changes before they land.

## Workflow notes

- Prefer the local mirror at `~/projects/wow-ui-source` for authoritative API behavior; fall back to the wiki
- Diff `live` against `ptr`/`beta` branches when a task involves upcoming patch changes
- Confirm assumptions about the target client (retail vs Classic) before writing client-specific code
