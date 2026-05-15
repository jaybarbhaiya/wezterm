# WezTerm Configuration

This repository contains a modular WezTerm configuration for Windows + WSL2.

## Overview

The entry file is `wezterm.lua`. It loads focused modules from `modules/`:

- `modules/appearance.lua`: theme, font, cursor style
- `modules/behavior.lua`: leader key, defaults, and window behavior
- `modules/domain.lua`: startup domain and startup working directory
- `modules/keys.lua`: keyboard shortcuts
- `modules/mouse.lua`: mouse actions for copy/paste behavior

## Environment Notes

- Default domain: `WSL:Ubuntu`
- Default startup working directory: `~`
- Leader key: `CTRL+a`
- Default keybindings are disabled and replaced by custom bindings in `modules/keys.lua`
- Color scheme: Google Light (base16)
- Tab bar: Fancy tab bar enabled, hidden when only one tab open

## Keybinding Reference

Leader key means: press `CTRL+a`, then the next key.

| Keys | Scope | Action | Notes |
| --- | --- | --- | --- |
| `CTRL+SHIFT+C` | Global | Copy selected text to clipboard | System clipboard copy |
| `CTRL+SHIFT+V` | Global | Paste from clipboard | System clipboard paste |
| `LEADER+SHIFT+\|` | Panes | Split current pane horizontally | New pane opens to the right, cwd set to `~` |
| `LEADER+SHIFT+_` | Panes | Split current pane vertically | New pane opens downward, cwd set to `~` |
| `LEADER+h` | Panes | Focus left pane | Pane navigation |
| `LEADER+l` | Panes | Focus right pane | Pane navigation |
| `LEADER+k` | Panes | Focus pane above | Pane navigation |
| `LEADER+j` | Panes | Focus pane below | Pane navigation |
| `LEADER+ALT+h` | Panes | Resize pane left | Resizes by 5 cells |
| `LEADER+ALT+l` | Panes | Resize pane right | Resizes by 5 cells |
| `LEADER+ALT+k` | Panes | Resize pane up | Resizes by 5 cells |
| `LEADER+ALT+j` | Panes | Resize pane down | Resizes by 5 cells |
| `LEADER+t` | Tabs | Open new tab | Opens in current pane domain, cwd `~` |
| `LEADER+w` | Tabs | Close current tab | No confirmation |
| `LEADER+[` | Tabs | Go to previous tab | Relative tab move: -1 |
| `LEADER+]` | Tabs | Go to next tab | Relative tab move: +1 |
| `LEADER+SHIFT+R` | Tabs | Rename current tab | Prompts for a new tab title |

## Mouse Reference

| Mouse Input | Action |
| --- | --- |
| Triple left click | Select semantic zone |
| Right click with selection | Copy selection to clipboard and clear selection |
| Right click without selection | Paste from clipboard |

## Maintenance Tips

- Add new keyboard shortcuts in `modules/keys.lua`.
- Add new mouse actions in `modules/mouse.lua`.
- Keep module responsibilities focused to make future edits safer.
