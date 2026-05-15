local wezterm = require 'wezterm'
local config = wezterm.config_builder and wezterm.config_builder() or {}

local function apply(target, values)
  for key, value in pairs(values) do
    target[key] = value
  end
end

apply(config, require 'modules.appearance')
apply(config, require 'modules.behavior')
apply(config, require 'modules.domain')

config.keys = require 'modules.keys'
config.mouse_bindings = require 'modules.mouse'

return config
