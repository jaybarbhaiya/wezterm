# WezTerm Configuration

## Overview

The entry file is `wezterm.lua`. It loads focused modules from `modules/`:

- `modules/appearance.lua`: theme, font, cursor style
- `modules/behavior.lua`: leader key, defaults, and window behavior
- `modules/domain.lua`: startup domain and startup working directory
- `modules/keys.lua`: keyboard shortcuts
- `modules/mouse.lua`: mouse actions for copy/paste behavior

## Keybinding Reference

Leader key means: press `CTRL+a`, then the next key.

| Keys             | Scope  | Action                          | Notes                                 |
| ---------------- | ------ | ------------------------------- | ------------------------------------- | ------------------------------------ |
| `CMD+C`          | Global | Copy selected text to clipboard | System clipboard copy                 |
| `CMD+V`          | Global | Paste from clipboard            | System clipboard paste                |
| `CMD+LeftArrow`  | Global | Move to start of the line       | Sends Ctrl-A                          |
| `CMD+RightArrow` | Global | Move to the end of the line     | Sends Ctrl-E                          |
| `LEADER+SHIFT+   | `      | Panes                           | Split current pane horizontally       | New pane opens to the right, cwd=`~` |
| `LEADER+SHIFT+_` | Panes  | Split current pane vertically   | New pane opens downward, cwd=`~`      |
| `LEADER+h`       | Panes  | Focus left pane                 | Pane navigation                       |
| `LEADER+l`       | Panes  | Focus right pane                | Pane navigation                       |
| `LEADER+k`       | Panes  | Focus pane above                | Pane navigation                       |
| `LEADER+j`       | Panes  | Focus pane below                | Pane navigation                       |
| `LEADER+ALT+h`   | Panes  | Resize pane left                | Resizes by 5 cells                    |
| `LEADER+ALT+l`   | Panes  | Resize pane right               | Resizes by 5 cells                    |
| `LEADER+ALT+k`   | Panes  | Resize pane up                  | Resizes by 5 cells                    |
| `LEADER+ALT+j`   | Panes  | Resize pane down                | Resizes by 5 cells                    |
| `LEADER+t`       | Tabs   | Open new tab                    | Opens in current pane domain, cwd=`~` |
| `LEADER+w`       | Tabs   | Close current tab               | No confirmation                       |
| `LEADER+[`       | Tabs   | Go to previous tab              | Relative tab move: -1                 |
| `LEADER+]`       | Tabs   | Go to next tab                  | Relative tab move: +1                 |
| `LEADER+1`       | Tabs   | Switch to tab 1                 | Direct tab activation                 |
| `LEADER+2`       | Tabs   | Switch to tab 2                 | Direct tab activation                 |
| `LEADER+3`       | Tabs   | Switch to tab 3                 | Direct tab activation                 |
| `LEADER+4`       | Tabs   | Switch to tab 4                 | Direct tab activation                 |
| `LEADER+5`       | Tabs   | Switch to tab 5                 | Direct tab activation                 |
| `LEADER+6`       | Tabs   | Switch to tab 6                 | Direct tab activation                 |
| `LEADER+7`       | Tabs   | Switch to tab 7                 | Direct tab activation                 |
| `LEADER+8`       | Tabs   | Switch to tab 8                 | Direct tab activation                 |
| `LEADER+9`       | Tabs   | Switch to tab 9                 | Direct tab activation                 |
| `LEADER+SHIFT+R` | Tabs   | Rename current tab              | Prompts for a new tab title           |
| `CMD+Q`          | Global | Quit WezTerm                    | Kills all tabs, no confirmation       |

## Mouse Reference

| Mouse Input                   | Action                                          |
| ----------------------------- | ----------------------------------------------- |
| Triple left click             | Select semantic zone                            |
| Right click with selection    | Copy selection to clipboard and clear selection |
| Right click without selection | Paste from clipboard                            |

## Maintenance Tips

- Add new keyboard shortcuts in `modules/keys.lua`.
- Add new mouse actions in `modules/mouse.lua`.
- Keep module responsibilities focused to make future edits safer.
