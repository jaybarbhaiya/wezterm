local wezterm = require("wezterm")
local act = wezterm.action

-- Helper: begin selection if none exists, then move
local function select_and_move(direction)
    return wezterm.action_callback(function(window, pane)
        -- If there's no selection yet, start cell selection
        -- (Selection is tracked by the window; this returns the currently selected text) 【3-7fdd9b】
        if window:get_selection_text_for_pane(pane) == "" then
            window:perform_action(act.CopyMode({ SetSelectionMode = "Cell" }), pane) -- start selecting 【1-22f136】
        end
        window:perform_action(act.CopyMode(direction), pane)                -- MoveLeft/MoveRight 【1-22f136】
    end)
end

-- Use Cmd+C / Cmd+V for copy/paste on macOS (only these bindings kept)
return {
    -- system clipboard copy/paste (Command)
    {
        key = "c",
        mods = "CMD",
        action = act.CopyTo("Clipboard"),
    },
    {
        key = "v",
        mods = "CMD",
        action = act.PasteFrom("Clipboard"),
    },
    -- macOS: Cmd+N -> open a new window
    {
        key = "n",
        mods = "CMD",
        action = wezterm.action.SpawnWindow,
    },
    -- macOS: Cmd+Left/Right -> move to start/end of line (send Ctrl-A / Ctrl-E)
    {
        key = "LeftArrow",
        mods = "CMD",
        action = act.SendString("\x01"),
    },
    {
        key = "RightArrow",
        mods = "CMD",
        action = act.SendString("\x05"),
    },

    -- key bindings to split panes, and move between them
    {
        key = "|",
        mods = "LEADER|SHIFT",
        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain", cwd = "~" }),
    },
    {
        key = "_",
        mods = "LEADER|SHIFT",
        action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain", cwd = "~" }),
    },
    {
        key = "h",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
        key = "l",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection("Right"),
    },
    {
        key = "k",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
        key = "j",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection("Down"),
    },

    -- key bindings for resizing panes
    {
        key = "h",
        mods = "LEADER|ALT",
        action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
    },
    {
        key = "l",
        mods = "LEADER|ALT",
        action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
    },
    {
        key = "k",
        mods = "LEADER|ALT",
        action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
    },
    {
        key = "j",
        mods = "LEADER|ALT",
        action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
    },

    -- key bindings for opening new tabs and moving between them
    {
        key = "t",
        mods = "LEADER",
        action = wezterm.action.SpawnCommandInNewTab({ domain = "CurrentPaneDomain", cwd = "~" }),
    },
    {
        key = "w",
        mods = "LEADER",
        action = wezterm.action.CloseCurrentTab({ confirm = false }),
    },
    {
        key = "[",
        mods = "LEADER",
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        key = "]",
        mods = "LEADER",
        action = wezterm.action.ActivateTabRelative(1),
    },

    -- key binding for numbered tab activation
    {
        key = "1",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(0),
    },
    {
        key = "2",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(1),
    },
    {
        key = "3",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(2),
    },
    {
        key = "4",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(3),
    },
    {
        key = "5",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(4),
    },
    {
        key = "6",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(5),
    },
    {
        key = "7",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(6),
    },
    {
        key = "8",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(7),
    },
    {
        key = "9",
        mods = "LEADER",
        action = wezterm.action.ActivateTab(8),
    },

    -- key binding to rename the current tab
    {
        key = "R",
        mods = "LEADER|SHIFT",
        action = wezterm.action.PromptInputLine({
            description = "Enter new name for tab",
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }),
    },

    -- Search for word under cursor / open search bar
    {
        key = "f",
        mods = "CMD",
        action = act.Search({ CaseSensitiveString = "" }),
    },

    -- Terminate wezterm, kill all tabs
    {
        key = "q",
        mods = "CMD",
        action = wezterm.action.QuitApplication
    }
}
